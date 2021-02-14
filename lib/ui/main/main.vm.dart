import 'package:flutter/widgets.dart';
import 'package:flutter_live_data/core.dart';
import 'package:mob_chana_flutter/application/router.dart';
import 'package:mob_chana_flutter/application/wrapper.dart';
import 'package:mvvm_bloc/mvvm_bloc.dart';
import 'package:provider/provider.dart';
import '../../data/preferences/user_preference.dart';
import '../../di/container.dart';
import '../_theme/theme.dart';

class MainVM extends ViewModel {
  final AppRouter router = inject<AppRouter>();
  final UserPreference userPreference = inject<UserPreference>();

  MainVM(LifeCycleObserver observer);

  initTheme(BuildContext context, bool isDarkMode) async {
    if (isDarkMode != null) {
      if (isDarkMode) {
        UIThemeDark uiThemeDark = UIThemeDark();
        context.read<AppWrapper>().setUITheme(uiThemeDark);
      } else {
        UIThemeLight uiThemeLight = UIThemeLight();
        context.read<AppWrapper>().setUITheme(uiThemeLight);
      }
    } else {
      isDarkMode = false;
      UIThemeLight uiThemeLight = UIThemeLight();
      context.read<AppWrapper>().setUITheme(uiThemeLight);
      userPreference.setLocalTheme(isDarkMode);
    }
  }
}
