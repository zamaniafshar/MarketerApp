import 'package:flutter/material.dart';

extension Tools on List {
  List<Widget> widgetBuilder({
    required final Widget Function(int index, dynamic item) builder,
  }) {
    final widgets = <Widget>[];
    for (int index = 0; index < this.length; index++) {
      widgets.add(builder(index, this[index]));
    }
    return widgets;
  }
}
