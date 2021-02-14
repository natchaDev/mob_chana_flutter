import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mob_chana_flutter/application/path.dart';
import 'package:path_provider/path_provider.dart';

import 'const.dart';
import 'log.dart';


Future<bool> createFile(String currentLanguageCode, String content) async {
  try {
    Directory directory = await getRootDirectory();
    File file = File(directory.path + getLangFileName(currentLanguageCode));
    file.createSync();
    file.writeAsStringSync(content);
    var path = Directory(directory.path).listSync();
    AppLog.d(path);
    return true;
  } catch (e) {
    return false;
  }
}

Future<String> readLanguageFile(String currentLanguageCode) async {
  Directory directory = await getRootDirectory();
  File filePath = File(directory.path + getLangFileName(currentLanguageCode));
  bool fileExists = filePath.existsSync();
  if (fileExists) {
    return filePath.readAsStringSync();
  } else {
    return await rootBundle.loadString(AppPath.language(currentLanguageCode));
  }
}

Future<Directory> getRootDirectory() async {
  return Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationSupportDirectory();
}

String getLangFileName(String currentLanguageCode) {
  switch (currentLanguageCode) {
    case LANGUAGE_TH_CODE:
      return LANG_TH_FILE;
    case LANGUAGE_EN_CODE:
      return LANG_EN_FILE;
    default:
      return LANG_EN_FILE;
  }
}
