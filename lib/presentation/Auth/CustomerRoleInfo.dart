import 'package:flutter/material.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';

class CustomerAdd extends StatefulWidget {
  const CustomerAdd({Key? key}) : super(key: key);

  @override
  State<CustomerAdd> createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  TextEditingController nameController = TextEditingController();

  String? get errorText {
    if (nameController.text.length > 12) {
      return "Введено неверное имя пользователя";
    } else if (nameController.text.isNotEmpty) {
      if (RegExp(r'[!@#<>?":_`~;[\]\\|=+/)(*&^%0-9-]')
          .hasMatch(nameController.text)) {
        return "Введено неверное имя пользователя";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  bool isPressed = false;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: PrimaryBackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
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
                    "Введите имя пользователя",
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
                    "Не более 12 символов и только латинские буквы",
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
                      controller: nameController,
                      autofocus: true,
                      showCursor: false,
                      cursorHeight: 26,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: primaryFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
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
