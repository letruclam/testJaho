
import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../../../locator.dart';
import 'loading_widget.dart';


class BaseWidget<T extends Object, V> extends StatefulWidget {
  final Widget Function(BuildContext context, V? data, T onBloc) builder;
  final Function(T) callBloc;
  final StreamController<V>? stateController;
  final Stream<bool> showLoading;

  const BaseWidget({Key? key, required this.callBloc, required this.builder,required this.stateController,required this.showLoading}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetState<T, V>();
  }

}

class _BaseWidgetState<T extends Object, V> extends State<BaseWidget<T, V>> {
  T bloc = locator<T>();

  @override
  void initState() {
    widget.callBloc(bloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
      status: widget.showLoading,
      child: StreamBuilder<V>(
          stream: widget.stateController?.stream,
          builder: (context, value) {
            return widget.builder(context, value.data,bloc);
          }),
    );
  }
}
