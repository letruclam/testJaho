import 'package:flutter/material.dart';

import '../../../locator.dart';


abstract class MBNState<V extends Object,T extends StatefulWidget> extends State<T> {

  getLocator() {
    return locator.get<V>();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
