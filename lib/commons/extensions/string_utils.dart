import 'package:intl/intl.dart';

extension StringUtil on String {
  List<String> chunk(int size) {
    var chunks = <String>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(substring(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}

extension StringFormatter on String {
  String toCapitalize() {
    return toBeginningOfSentenceCase(this);
  }
}

String replacePrefix(String s) {
  RegExp regExp = RegExp(r'^(นาย|นางสาว|นาง|น\.ส\.|ดร\.|dr\.|mr\.|mrs\.|ms\.|Dr\.|Mr\.|Mrs\.|Ms\.)');
  return s.replaceAll(regExp, '');
}

String replaceVowels(String s) {
  RegExp regExp = RegExp(r'([^ก-ฮ])');
  return s.replaceAll(regExp, '');
}

String getFirstCharacterNameEn(String s) {
  if (s == null || s.length == 0) {
    return '';
  }
  String removePrefix = replacePrefix(s);
  if (removePrefix.length == 0) {
    return '';
  } else {
    return removePrefix[0].toUpperCase();
  }
}

String getFirstCharacterNameTh(String s) {
  if (s == null || s.length == 0) {
    return '';
  }
  String removePrefix = replacePrefix(s);
  String removeVowels = replaceVowels(removePrefix);
  if (removeVowels.length == 0) {
    return '';
  } else {
    return removeVowels[0];
  }
}
