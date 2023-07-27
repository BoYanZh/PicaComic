import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:workmanager/workmanager.dart';
import '../base.dart';
import '../network/picacg_network/methods.dart';
import 'notification.dart';

@pragma('vm:entry-point')
void onStart() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  Workmanager().executeTask((taskName, inputData) async{
    var appdata = Appdata();
    appdata.readData();
    var notifications = Notifications();
    await notifications.init();
    if (appdata.token != "") {
      var network = PicacgNetwork(appdata.token);
      var userInfo = await network.getProfile(false);
      if (userInfo.error) {
        // 这里经常出现错误, 发送通知影响用户体验
        return true;
      }
      if (userInfo.data.isPunched == false) {
        var res = await network.punchIn();
        if (res) {
          notifications.sendUnimportantNotification("自动打卡", "成功签到");
          return true;
        }
      } else {
        return true;
      }
    }
    return true;
  });
}

void runBackgroundService() async{
  await Workmanager().cancelAll();
  await Workmanager().registerPeriodicTask(
    "Piacg PunchIn",
    "打卡",
    frequency: const Duration(minutes: 1440),
    constraints: Constraints(networkType: NetworkType.connected),
  );
}

void cancelBackgroundService() async{
  await Workmanager().cancelAll();
}