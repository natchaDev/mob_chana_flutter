import 'package:flutter/widgets.dart';
import 'package:mob_chana_flutter/ui/_theme/theme.dart';


class AppWrapper with ChangeNotifier {
  UITheme _uiTheme;

  UITheme get uiTheme => _uiTheme;

  void setUITheme(UITheme uiTheme) {
    _uiTheme = uiTheme;
    notifyListeners();
  }
}
