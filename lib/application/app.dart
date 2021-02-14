import 'package:mob_chana_flutter/application/wrapper.dart';
import 'package:mob_chana_flutter/di/container.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

import 'env.dart';
import 'localization.dart';

class App extends StatefulWidget {
  final Widget Function(BuildContext context, EnvironmentConfig env, DiContainer di) builder;
  final EnvironmentConfig env;

  App({
    Key key,
    @required this.builder,
    @required this.env,
    @required DiContainer container,
  }) : super(key: key) {
    Di(container);
    Di().container.singleton<EnvironmentConfig>(env);
  }

  @override
  _App createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    Di().container.singleton<BuildContext>(context);

    // build
    Widget app = ChangeNotifierProvider(
      create: (context) => AppWrapper(),
      child: AppLocalization(
        context: context,
        child: widget.builder(
          context,
          widget.env,
          Di().container,
        ),
        supportedLocales: widget.env.supportedLocales,
      ),
    );

    return app;
  }
}
