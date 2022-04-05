import 'package:flutter/material.dart';

class SqureIconButton extends StatelessWidget {
  const SqureIconButton({
    required this.icon,
    required this.caption,
    required this.captionStyle,
    required this.color,
    this.onTap,
  });

  final Icon icon;
  final Color color;
  final String caption;
  final TextStyle captionStyle;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onTap,
        child: Material(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  caption,
                  style: captionStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
