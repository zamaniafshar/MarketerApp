import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final Widget message;
  final bool isDone;
  final int length;
  final Widget Function(BuildContext context, int index) builder;
  final EdgeInsetsGeometry padding;

  CustomListView({
    required this.length,
    required this.builder,
    this.message = const Text(''),
    this.isDone = true,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      if (length == 0) {
        return message;
      } else {
        return ListView.builder(
          padding: padding,
          itemCount: length,
          itemBuilder: builder,
        );
      }
    }
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
