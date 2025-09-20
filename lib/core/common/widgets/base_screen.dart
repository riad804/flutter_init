import 'package:rx_state_manager/rx_state_manager.dart';

extension ControllerExtension on BuildContext {
  T of<T extends RxController>() => BaseScreen.of<T>(this);
}

abstract class BaseScreen<T extends RxController> extends ScreenI<T> {
  const BaseScreen({super.key});

  /// Build the UI with the controller
  Widget buildScreen(BuildContext context, T controller);

  /// Access the controller from child widgets
  static T of<T extends RxController>(BuildContext context) {
    final _InheritedController<T>? inherited =
        context.dependOnInheritedWidgetOfExactType<_InheritedController<T>>();
    if (inherited == null) {
      throw FlutterError(
          "No BaseScreen controller of type $T found in context");
    }
    return inherited.controller;
  }

  @override
  State<BaseScreen<T>> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends RxController> extends State<BaseScreen<T>> {
  late final T controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
    controller = widget.controller!;
    }
    controller.onInit();
    widget.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    widget.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedController<T>(
      controller: controller,
      child: widget.buildScreen(context, controller),
    );
  }
}


abstract class ScreenI<T extends RxController> extends StatefulWidget {
  const ScreenI({super.key});

  @protected
  T? get controller => null;

  /// Called when the screen is initialized
  @protected
  void onInit() {}

  /// Called when the screen is disposed
  @protected
  void onDispose() {}
}

/// InheritedWidget to expose controller
class _InheritedController<T extends RxController> extends InheritedWidget {
  final T controller;

  const _InheritedController({
    super.key,
    required super.child,
    required this.controller,
  });

  @override
  bool updateShouldNotify(covariant _InheritedController<T> oldWidget) =>
      oldWidget.controller != controller;
}
