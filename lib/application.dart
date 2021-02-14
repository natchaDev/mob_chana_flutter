import 'package:flutter/material.dart';
import 'package:mob_chana_flutter/ui/_theme/theme.dart';

import 'application/app.dart';
import 'application/env.dart';
import 'application/router.dart';
import 'di/container.dart';

class MainApplication extends StatelessWidget {
  final EnvironmentConfig env;
  final DiContainer container;

  const MainApplication({
    Key key,
    @required this.env,
    @required this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget app;

    app = App(
        env: env,
        container: container,
        builder: (_context, env, container) {
          var router = inject<AppRouter>();
          var uitheme = inject<UITheme>();

          return MaterialApp(
            title: 'Mob Chana',
            theme: uitheme.theme,
            home: router.home,
          );
        });

    return app;
  }
}
