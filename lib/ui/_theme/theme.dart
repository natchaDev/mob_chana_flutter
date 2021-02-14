import 'package:flutter/material.dart';

abstract class UITheme {
  Color get primaryColor;

  Color get abbBarColor;

  Color get backgroundColor;

  Color get backgroundLeagueColor;

  Color get tileColor;

  Color get indicatorTabColor;

  Color get colorNestedTab;

  Color get unSelectColor;

  Color get dividerLine;

  Color get timelineColor;

  Color get textColor;

  Color get subTextColor;

  Color get overLayColor;

  Color get pointTeamHomeColor;

  ThemeData get theme;
}

enum ThemeType {
  Light,
  Dark,
}

class UIThemeLight extends UITheme {
  Color get primaryColor => Colors.yellow;

  Color get abbBarColor => null;

  Color get backgroundColor => null;

  Color get backgroundLeagueColor => null;

  Color get tileColor => null;

  Color get indicatorTabColor => null;

  Color get colorNestedTab => null;

  Color get unSelectColor => null;

  Color get dividerLine => null;

  Color get timelineColor => null;

  Color get textColor => null;

  Color get subTextColor => null;

  Color get overLayColor => null;

  Color get pointTeamHomeColor => null;

  ThemeData get theme => ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

class UIThemeDark extends UITheme {
  Color get primaryColor => Color(0xffEA6E37);

  Color get abbBarColor => Color(0xff212121);

  Color get backgroundColor => Color(0xff121212);

  Color get backgroundLeagueColor => Color(0xff262626);

  Color get tileColor => Color(0xff3b3b3b);

  Color get indicatorTabColor => Color(0xffEA6E38);

  Color get colorNestedTab => Color(0xff212121);

  Color get unSelectColor => Color(0xffA6A6A6).withOpacity(0.3);

  Color get dividerLine => Color(0xff5F5F5F);

  Color get timelineColor => Color(0xffffffff).withOpacity(1);

  Color get textColor => Colors.white;

  Color get subTextColor => Color(0xffB8B8B8);

  Color get overLayColor => Color(0xff000000).withOpacity(0.6);

  Color get pointTeamHomeColor => Color(0xff00C448);

  ThemeData get theme => ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
