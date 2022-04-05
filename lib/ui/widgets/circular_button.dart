import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    required this.child,
    this.color = Colors.transparent,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.elevation = 0,
    this.width = 65,
    this.height = 65,
  });

  final double width;
  final double height;
  final Color color;
  final Widget child;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: color,
      elevation: elevation,
      child: MaterialButton(
        shape: const CircleBorder(),
        height: height,
        minWidth: width,
        child: Padding(
          padding: padding,
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }
}
