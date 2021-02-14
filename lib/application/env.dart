import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../commons/log.dart';

enum SupportedLocale {
  TH,
  EN,
}

@immutable
abstract class EnvironmentConfig extends InheritedWidget {
  EnvironmentConfig({
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  final int logLevel = AppLog.LOG_LEVEL_OFF;
  final bool isDebugMode = false;

  bool get isProduction {
    return !isDebug;
  }

  bool get isDebug {
    return isDebugMode;
  }

  final bool isUsingMockApiData = false;

  final bool isLogging = false;

  final bool isSystemLogging = false;

  final Map<SupportedLocale, Locale> supportedLocales = {
    SupportedLocale.EN: Locale('en', 'US'),
    SupportedLocale.TH: Locale('th', 'TH'),
  };

  String getServiceApiBaseUrl();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static EnvironmentConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EnvironmentConfig>();
  }
}

class DevApiEnvironment extends EnvironmentConfig {
  @override
  final int logLevel = AppLog.LOG_LEVEL_D;

  @override
  final bool isDebugMode = true;

  @override
  final bool isUsingMockApiData = false;

  @override
  String getServiceApiBaseUrl() => 'https://mdinote-demo.ctdev.cloud/wp-json';
}

class DevMockEnvironment extends EnvironmentConfig {
  @override
  final int logLevel = AppLog.LOG_LEVEL_D;

  @override
  final bool isDebugMode = true;

  @override
  final bool isUsingMockApiData = true;

  @override
  String getServiceApiBaseUrl() => null;
}

class ProductionEnvironment extends EnvironmentConfig {
  @override
  final int logLevel = AppLog.LOG_LEVEL_W;

  @override
  final bool isDebugMode = false;

  @override
  final bool isUsingMockApiData = false;

  @override
  String getServiceApiBaseUrl() => '';
}
