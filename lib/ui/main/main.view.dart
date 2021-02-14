import 'package:mob_chana_flutter/ui/_widgets/ui_view.dart' as app;
import 'package:flutter/material.dart';
import 'package:mvvm_bloc/vm.dart';
import '../../application/router.dart';
import '../../data/preferences/user_preference.dart';
import '../../di/container.dart';
import '../_theme/theme.dart';
import 'main.vm.dart';

class MainView extends app.UIView<MainVM> {
  final AppRouter router = inject<AppRouter>();
  final UserPreference userPreference = inject<UserPreference>();
  UITheme uiTheme;

  MainView(ViewModel viewModel) : super(viewModel);

  @override
  String get name => '/main';

  @override
  void onInit() {
    super.onInit();
    initTheme();
  }

  initTheme() async {
    final theme = await userPreference.getLocalTheme();
    $vm.initTheme(context, true);
  }



  @override
  Widget render(BuildContext context) {
    uiTheme = getUITheme();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("MOB CHANA",style: TextStyle(color: Colors.black),),
            )
            // Container(
            //   color: uiTheme.primaryColor,
            //   margin: EdgeInsets.all(20.0),
            //   child: Text(
            //     t('.name'),
            //     style: TextStyle(
            //       color: Colors.red,
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
