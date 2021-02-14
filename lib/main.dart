import 'package:flutter/widgets.dart';

import 'application.dart';
import 'application/env.dart';
import 'di/container.dart';

void main() {
  var env = DevMockEnvironment();
  var container = DiContainer().withDefaultDependencies();

  runApp(
    MainApplication(
      env: env,
      container: container,
    ),
  );
}
