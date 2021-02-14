import 'package:mob_chana_flutter/application/localization.dart';
import 'package:mob_chana_flutter/application/wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_bloc/mvvm_bloc.dart' as root;

import '../_theme/theme.dart';
import 'package:provider/provider.dart';

abstract class UIView<VM extends root.ViewModel> extends root.View<VM> {
  final _ContextHolder _contextHolder = _ContextHolder();

  String get name;
  BuildContext get context => _contextHolder.context;

  UITheme getUITheme() => context.watch<AppWrapper>().uiTheme;

  UIView(root.ViewModel viewModel) : super(viewModel);

  String t(String key) => AppLocalization.of(_contextHolder.context).translate(
        key.startsWith('.') ? '$name$key' : key,
      );

  @override
  Widget build(BuildContext context) {
    _contextHolder.context = context;
    return render(context);
  }

  Widget render(BuildContext context);
}

class _ContextHolder {
  BuildContext context;
}
