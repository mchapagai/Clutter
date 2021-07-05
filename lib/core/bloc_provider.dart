import 'package:flutter/material.dart';

typedef BlocBuilder<T> = T Function();
typedef BlocDisposer<T> = Function(T);

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase?> extends StatefulWidget {
  final Widget? child;
  final BlocBuilder<T>? blocBuilder;
  final BlocDisposer<T>? blocDispose;

  BlocProvider({this.child, this.blocBuilder, this.blocDispose});

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  /// using [#getElementForInheritedWidgetOfExactType] basically means
  /// I do not want the context that invokes the [BlocProvider] to be registered
  /// as the dependency of the [InheritedWidget] since I do not need it.
  static T? of<T extends BlocBase>(BuildContext context) {
    _BlocProviderInherited<T>? provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget as _BlocProviderInherited<T>?;

    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase?> extends State<BlocProvider<T?>> {
  T? bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.blocBuilder!();
  }

  @override
  void dispose() {
    if (widget.blocDispose != null) {
      widget.blocDispose!(bloc);
    } else {
      bloc?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new _BlocProviderInherited<T?>(
      bloc: bloc,
      child: widget.child!,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
