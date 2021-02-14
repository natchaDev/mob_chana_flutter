import 'package:flutter/widgets.dart';
import 'package:mob_chana_flutter/application/localization.dart';

extension TextExtension on Text {
  Text t({BuildContext context}) {
    var o = context != null ? AppLocalization.of(context) : AppLocalization.ins;
    return Text(
      o.translate(data),
      key: key,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }
}

extension StringExtension on String {
  String t({BuildContext context}) {
    var o = context != null ? AppLocalization.of(context) : AppLocalization.ins;
    return o.translate(this);
  }
}
