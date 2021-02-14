import 'package:flutter/foundation.dart';

@immutable
class Font {
  final FontWeight weight;
  final bool isItalic;

  Font({
    this.weight = FontWeight.REGULAR,
    this.isItalic = false,
  });

  String get name => '';

  Font get italic => Font(weight: weight, isItalic: true);

  Font get regular => Font();

  Font get extraLight => Font(weight: weight, isItalic: isItalic);

  Font get light => Font(weight: FontWeight.LIGHT, isItalic: isItalic);

  Font get medium => Font(weight: FontWeight.MEDIUM, isItalic: isItalic);

  Font get semiBold => Font(weight: FontWeight.SEMI_BOLD, isItalic: isItalic);

  Font get bold => Font(weight: FontWeight.BOLD, isItalic: isItalic);
}

enum FontWeight { REGULAR, EXTRA_LIGHT, LIGHT, MEDIUM, SEMI_BOLD, BOLD }

class BaiJamjureeFont extends Font {
  String get name {
    var italic = isItalic ? 'Italic' : '';
    switch (weight) {
      case FontWeight.REGULAR:
        return 'BaiJamjuree-Regular$italic';
      case FontWeight.EXTRA_LIGHT:
        return 'BaiJamjuree-ExtraLight$italic';
      case FontWeight.LIGHT:
        return 'BaiJamjuree-Light$italic';
      case FontWeight.MEDIUM:
        return 'BaiJamjuree-Medium$italic';
      case FontWeight.SEMI_BOLD:
        return 'BaiJamjuree-SemiBold$italic';
      case FontWeight.BOLD:
        return 'BaiJamjuree-Bold$italic';
      default:
        throw Exception();
    }
  }
}
