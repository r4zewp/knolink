import 'package:flutter/material.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';
import '../../../datasources/env/env.dart';

class TutorAddUniv extends StatefulWidget {
  const TutorAddUniv({Key? key, required this.pagec}) : super(key: key);

  final PageController pagec;

  @override
  State<TutorAddUniv> createState() => _TutorAddUnivState();
}

class _TutorAddUnivState extends State<TutorAddUniv> {
  TextEditingController uniController = TextEditingController();

  String? get errorText {
    if (uniController.text.length > 10) {
      return "Введено неверное название";
    } else if (uniController.text.isNotEmpty) {
      if (RegExp(r'[!@#<>?":_`~;[\]\\|=+/)(*&^%0-9]')
          .hasMatch(uniController.text)) {
        return "Введено неверное название";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    uniController.dispose();
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: PrimaryBackButton(
          color: Colors.white,
          onPressed: () {
            widget.pagec.previousPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
            );
          },
        ),
      ),
      body: Center(
        child: SizedBox(
          width: screenSize.width * 0.911,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Введите название университета",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: primaryFontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025 / 2,
                  ),
                  Text(
                    "Не более 10 символов, используйте аббревиатуру",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontFamily: primaryFontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.911,
                    child: TextField(
                      scrollPadding: EdgeInsets.zero,
                      controller: uniController,
                      autofocus: true,
                      showCursor: false,
                      cursorHeight: 26,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: primaryFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.only(left: screenSize.width * 0.044 / 2),
                        focusedBorder: primaryInputBorder,
                        enabledBorder: primaryInputBorder,
                        focusedErrorBorder: primaryInputBorder,
                        disabledBorder: primaryInputBorder,
                        errorBorder: primaryErrorInputBorder,
                        errorText: isPressed ? errorText : null,
                        errorStyle: const TextStyle(
                          color: primaryErrorColor,
                          fontFamily: primaryFontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      onSubmitted: (String value) {
                        setState(() => isPressed = true);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: screenSize.width * 0.911,
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenSize.height * 0.025),
                  child: TextButton(
                    onPressed: () {
                      setState(() => isPressed = true);
                      if (errorText != null) {
                      } else {
                        /// TODO: SEND AUTH REQUEST
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      splashFactory: NoSplash.splashFactory,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    child: const Text(
                      "Далее",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: primaryFontFamily,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
