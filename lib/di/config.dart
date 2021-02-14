import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mob_chana_flutter/application/router.dart';
import 'package:mob_chana_flutter/data/repositories/api_repository.dart';
import 'package:mob_chana_flutter/data/services/api_service.dart';
import 'package:mob_chana_flutter/events/bus.dart';
import 'package:mob_chana_flutter/ui/_theme/theme.dart';
import '../application/env.dart';
import '../commons/media_query.dart';
import '../data/preferences/user_preference.dart';
import '../data/services/base_service.dart';
import 'container.dart';

extension defaultSetting on DiContainer {
  DiContainer withDefaultDependencies() {

    // === Service ===
    singletonFactory<ApiService>((c) {
      return ApiService();
    });

    singletonFactory<BaseService>((c) {
      return BaseService(c.get<EnvironmentConfig>(), baseUrl: 'https://api1.ct.cool');
    }, instanceName: 'api1');

    singletonFactory<BaseService>((c) {
      return BaseService(c.get<EnvironmentConfig>(), baseUrl: 'https://api2.ct.cool');
    }, instanceName: 'api2');

    // === Repository ===
    singletonFactory<ApiRepository>((_) {
      return ApiRepository();
    });

    // === Preference ===
    singletonFactory<UserPreference>((_) {
      return UserPreference();
    });

    // === Core Framework ===
    singletonFactory<BuildContext>((_) {
      return null;
    });
    singletonFactory<Bus>((_) {
      return Bus();
    });
    singletonFactory<UITheme>((_) {
      return UIThemeLight();
    });
    singletonFactory<AppRouter>((c) {
      return AppRouter(
        context: c.get<BuildContext>(),
      );
    });

    // === Commons ===
    singletonFactory<AppMediaQuery>((_) {
      return AppMediaQuery();
    });

    // === Third-Party ===
    singletonFactory<Dio>((_) {
      return Dio();
    });

    return this;
  }
}
