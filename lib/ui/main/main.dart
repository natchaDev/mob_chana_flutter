
import 'package:flutter/widgets.dart';
import 'package:mvvm_bloc/mvvm_bloc.dart';

import 'main.view.dart';
import 'main.vm.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVMBLoC(
      view: (context, viewModel) => MainView(viewModel),
      viewModel: (lifeCycleObserver) => MainVM(lifeCycleObserver),
    ).build();
  }
}
