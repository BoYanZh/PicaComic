import os
import subprocess

fontUse = """
  fonts:
    - family: font
      fonts:
        - asset: fonts/NotoSansSC-Regular.ttf
"""

file = open("pubspec.yaml", "r")
content = file.read()
file.close()
file = open("pubspec.yaml", "a")
file.write(fontUse)
file.close()

subprocess.run(["flutter", "build", "windows"], shell=True)

file = open("pubspec.yaml", "w")
file.write(content)
