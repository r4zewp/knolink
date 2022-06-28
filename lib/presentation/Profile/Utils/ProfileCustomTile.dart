import 'package:flutter/material.dart';

import '../../../datasources/env/env.dart';

class ProfileCustomTile extends StatelessWidget {
  const ProfileCustomTile({
    Key? key,
    required this.label,
    this.underLabel,
    required this.isRightArrowNeeded,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final String? underLabel;
  final bool? isRightArrowNeeded;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 2.0),
                blurRadius: 5.0,
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: const Color(0xff6969B3).withOpacity(0.9),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              screenSize.width * 0.044,
              screenSize.height * 0.0125,
              screenSize.width * 0.022,
              screenSize.height * 0.0125,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: primaryFontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                isRightArrowNeeded!
                    ? const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24,
                        color: Colors.white,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
