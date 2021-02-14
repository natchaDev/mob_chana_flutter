
import 'package:flutter/widgets.dart';
import 'package:mob_chana_flutter/commons/media_query.dart';
import 'package:mob_chana_flutter/di/container.dart';
import 'package:mvvm_bloc/commons/builder.dart';

@immutable
class ResponsiveWidget extends StatelessWidget {
  final AppMediaQuery mediaQuery = inject<AppMediaQuery>();
  final bool cache;
  final Widget Function() mobile;
  final Widget Function() tablet;
  static CacheBuilder<LayoutType> _cacheBuilder = CacheBuilder<LayoutType>();

  ResponsiveWidget({
    Key key,
    @required this.mobile,
    @required this.tablet,
    this.cache = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var layout = mediaQuery.getLayoutType(context);
    if (!cache) {
      switch (layout) {
        case LayoutType.mobile:
          return mobile?.call();
        case LayoutType.tablet:
          return tablet?.call();
        default:
          throw Exception();
      }
    } else {
      switch (layout) {
        case LayoutType.mobile:
          return _cacheBuilder.buildCache(
            state: layout,
            body: mobile?.call(),
          );
        case LayoutType.tablet:
          return _cacheBuilder.buildCache(
            state: layout,
            body: tablet?.call(),
          );
        default:
          throw Exception();
      }
    }
  }
}
