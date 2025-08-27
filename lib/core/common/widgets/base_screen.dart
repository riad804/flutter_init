import 'package:flutter/material.dart';

import '../../../app/di/injection.dart';
import '../../rx/rx_view_model.dart';

extension BaseScreenVMX<VM extends RxViewModel> on BaseScreen<VM> {
  VM get getVM => sl<VM>();
}

T viewModel<T extends RxViewModel>() => sl<T>();

/// BaseScreen: automatically binds a ViewModel and manages lifecycle
abstract class BaseScreen<VM extends RxViewModel> extends StatefulWidget implements ScreenI<VM> {
  const BaseScreen({super.key});

  /// Build the screen UI
  Widget build(BuildContext context, VM vm);

  @override
  State<BaseScreen<VM>> createState() => _BaseScreenState<VM>();
}

class _BaseScreenState<VM extends RxViewModel> extends State<BaseScreen<VM>> {
  late final VM vm;

  @override
  void initState() {
    vm = sl<VM>();
    widget.onInit();
    super.initState();
  }


  @override
  void dispose() {
    vm.dispose();
    widget.onDispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return widget.build(context, vm);
  }
}

mixin ScreenI<VM extends RxViewModel> on Widget {

  @protected
  onInit() {}

  @protected
  onDispose() {}
}