import 'package:flutter/material.dart';
import 'package:knolink/datasources/env/env.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.textColor,
    this.color,
    this.shadowColor,
  }) : super(key: key);

  final String title;
  final Color? color;
  final Color? textColor;
  final Color? shadowColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.6,
      height: screenSize.height * 0.06,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 2.0,
          side: BorderSide.none,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          splashFactory: NoSplash.splashFactory,
          padding: EdgeInsets.zero,
          primary: Colors.transparent,
          shadowColor: shadowColor ?? Colors.white,
          backgroundColor: color ?? const Color(0xff303030),
          surfaceTintColor: Colors.transparent,
          onSurface: Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: primaryFontFamily,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
