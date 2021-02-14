import 'package:flutter/widgets.dart';
import 'package:mob_chana_flutter/commons/IHolder.dart';
import 'package:mob_chana_flutter/ui/main/main.dart';
import 'package:mvvm_bloc/commons/life_cycle_listener.dart';

@immutable
class AppRouter {
  final IHolder<BuildContext> _context = IHolder<BuildContext>();
  final bool _useReplacement;
  final Duration _useDelay;
  final LifeCycleListener lifeCycle;

  AppRouter({
    BuildContext context,
    bool replacement = false,
    Duration delay,
    this.lifeCycle,
  })  : this._useReplacement = replacement,
        this._useDelay = delay {
    _context.instance = context;
  }

  Widget get home => MainPage();

  PageRoute Function(Widget widget) get defaultPageRoute => (Widget widget) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => widget,
        );
      };

  AppRouter of(BuildContext context) => AppRouter(
        context: context ?? _context.instance,
        replacement: _useReplacement,
        delay: _useDelay,
        lifeCycle: lifeCycle,
      );

  AppRouter replace([bool replacing = true]) => AppRouter(
        context: _context.instance,
        replacement: replacing ?? _useReplacement,
        delay: _useDelay,
        lifeCycle: null,
      );

  AppRouter delay(Duration duration) => AppRouter(
        context: _context.instance,
        replacement: _useReplacement,
        delay: duration ?? _useDelay,
        lifeCycle: lifeCycle,
      );

  AppRouter observeBy(LifeCycleListener listener) => AppRouter(
        context: _context.instance,
        replacement: _useReplacement,
        delay: _useDelay,
        lifeCycle: listener,
      );

  Future<T> _execRoute<T>(Future<T> Function() f) async {
    if (_useDelay != null) {
      return Future.delayed(_useDelay, f);
    } else if (lifeCycle != null) {
      lifeCycle.onPause();
      await Future(f);
      lifeCycle.onResume();
    }
    return Future(f);
  }

  void push(
    Widget page, {
    BuildContext context,
    PageRoute Function(Widget widget) builder,
  }) {
    context ??= _context.instance;
    builder ??= defaultPageRoute;
    if (_useReplacement) {
      _execRoute(() => Navigator.pushReplacement(context, builder(page)));
    } else {
      _execRoute(() => Navigator.push(context, builder(page)));
    }
  }

  bool pop({
    dynamic result,
    BuildContext context,
  }) {
    try {
      context ??= _context.instance;
      Navigator.pop(context, result);
      return true;
    } catch (e) {
      return false;
    }
  }

  void popToRoot({
    BuildContext context,
  }) {
    context ??= _context.instance;
    popUntil((route) => route.isFirst);
  }

  void popUntil(
    RoutePredicate predicate, {
    BuildContext context,
  }) {
    context ??= _context.instance;
    Navigator.of(context).popUntil(predicate);
  }
}
