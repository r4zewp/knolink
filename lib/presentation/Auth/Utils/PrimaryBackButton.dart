import 'package:flutter/material.dart';

class PrimaryBackButton extends StatelessWidget {
  const PrimaryBackButton({
    Key? key,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color? color;

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
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 28,
      ),
    );
  }
}
