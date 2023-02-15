
class Profile {
  String id;
  String title;
  String email;
  String name;
  int level;
  int exp;
  String avatarUrl;
  bool? isPunched;
  String? slogan;
  Profile(this.id, this.avatarUrl, this.email, this.exp, this.level, this.name, this.title, this.isPunched, this.slogan);
}

class KeyWords {
  var keyWords = <String>[];
}

class CategoryItem {
  String title;
  String path;
  CategoryItem(this.title, this.path);
}

class InitData {
  String imageServer;
  String fileServer;
  var categories = <CategoryItem>[];
  InitData(this.imageServer, this.fileServer);
}

class ComicItemBrief {
  String title;
  String author;
  int likes;
  String path;
  String id;
  ComicItemBrief(this.title, this.author, this.likes, this.path, this.id){
    if(title.length>50) {
      title = "${title.substring(0,48)}...";
    }
    if(author.length>50) {
      author = "${author.substring(0,48)}...";
    }
  }
}

class ComicItem {
  String id;
  Profile creator;
  String title;
  String description;
  String thumbUrl;
  String author;
  String chineseTeam;
  List<String> categories;
  List<String> tags;
  int likes;
  int comments;
  bool isLiked;
  bool isFavourite;
  int epsCount;
  ComicItem(
      this.creator,
      this.title,
      this.description,
      this.thumbUrl,
      this.author,
      this.chineseTeam,
      this.categories,
      this.tags,
      this.likes,
      this.comments,
      this.isFavourite,
      this.isLiked,
      this.epsCount,
      this.id
      );
  ComicItemBrief toBrief(){
    return ComicItemBrief(title, author, likes, thumbUrl, id);
  }
}

class Comment {
  String name;
  String avatarUrl;
  String userId;
  int level;
  String text;
  int reply;
  String id;
  bool isLiked;
  int likes;

  Comment(this.name, this.avatarUrl, this.userId, this.level, this.text, this.reply, this.id,this.isLiked,this.likes);
}

class Comments {
  List<Comment> comments;
  String id;
  int pages;
  int loaded;

  Comments(this.comments, this.id, this.pages, this.loaded);
}

class Favorites {
  List<ComicItemBrief> comics;
  int pages;
  int loaded;

  Favorites(this.comics, this.pages, this.loaded);
}

class SearchResult{
  String keyWord;
  String sort;
  int pages;
  int loaded;
  List<ComicItemBrief> comics;
  SearchResult(this.keyWord,this.sort,this.comics,this.pages,this.loaded);
}

class Reply{
  String id;
  int loaded;
  int total;
  List<Comment> comments;
  Reply(this.id,this.loaded,this.total,this.comments);
}

class DownloadInfo{
  String id;
  int ep;
  int total;
  int downloaded = 0;
  DownloadInfo(this.id,this.ep,this.total);
}