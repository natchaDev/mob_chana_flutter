import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

@deprecated
class JsonReader {
  Future<Map<String, dynamic>> readMockDataFromFile(String filename,
      [String extension = 'json']) async {
    final content = await rootBundle.loadString("assets/mock/$filename.$extension");
    var m = json.decode(content);
    return m;
  }
}
