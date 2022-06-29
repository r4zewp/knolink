import 'package:flutter/material.dart';

class PrimaryArrowRightButton extends StatelessWidget {
  const PrimaryArrowRightButton({
    Key? key,
    this.color,
    required this.onPressed,
    this.size,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      color: color ?? Colors.black,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      disabledColor: Colors.transparent,
      onPressed: onPressed,
      icon: Icon(
        Icons.keyboard_arrow_right_outlined,
        size: size ?? 32,
      ),
    );
  }
}
