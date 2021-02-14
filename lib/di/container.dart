import 'package:get_it/get_it.dart';
export 'config.dart';

class DiContainer {
  final _getIt = GetIt.I;

  T get<T>([String instanceName]) => _getIt.get<T>(instanceName);

  void singletonFactory<T>(T Function(DiContainer) factory, {String instanceName}) {
    try {
      var i = _getIt.get<T>();
      _getIt.unregister(instance: i, instanceName: instanceName);
    } catch (e) {}
    _getIt.registerLazySingleton(() {
      return factory(this);
    }, instanceName: instanceName);
  }

  void singleton<T>(T instance, {String instanceName}) {
    try {
      var i = _getIt.get<T>(instanceName);
      _getIt.unregister<T>(instance: i, instanceName: instanceName);
    } catch (e) {}
    _getIt.registerSingleton<T>(instance, instanceName: instanceName);
  }

//  void test() {
//    debugPrint('_getIt.factories = ${_getIt.factories}');
//    for (var x in _getIt.factories.keys) {
//      debugPrint('$x :: ${_getIt.factories[x]}');
//    }
//  }
}

class Di {
  static Di _singleton;

  factory Di([DiContainer container]) {
    _singleton ??= Di._internal();
    if (container != null) _singleton.container = container;
    return _singleton;
  }

  Di._internal();

  DiContainer container;
}

T inject<T>([String instanceName]) => Di().container.get<T>(instanceName);

//EnvironmentConfig injectEnv() => Di().container.get<EnvironmentConfig>('env');
