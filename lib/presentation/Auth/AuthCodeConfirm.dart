import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/ChooseRole.dart';
import 'package:knolink/presentation/LoadingWidget.dart';
import 'package:knolink/presentation/Utils/PrimaryButton.dart';
import 'package:page_transition/page_transition.dart';

import '../bloc/sign/sign_bloc.dart';
import 'Utils/PrimaryBackButton.dart';

class CodeConfirm extends StatefulWidget {
  const CodeConfirm({Key? key}) : super(key: key);

  @override
  State<CodeConfirm> createState() => _CodeConfirmState();
}

class _CodeConfirmState extends State<CodeConfirm> {
  TextEditingController codeController = TextEditingController();

  /// function to get error text
  String? getErrorText(String value) {
    if (codeController.text != value || codeController.text.isEmpty) {
      return "Введен неверный код";
    } else {
      return null;
    }
  }

  String? _code;
  String? _uid;

  /// splitting code :D
  void splitCode(String value) {
    _code = value.substring(0, 4);
    _uid = value.substring(4, value.length);
  }

  void applyCode(String code, String uid) => BlocProvider.of<SignBloc>(context)
      .add(CodeCheckTriggered(code: code, uid: uid));

  void gotoRoleChoice() => Navigator.of(context).push(PageTransition(
      child: const ChooseRole(), type: PageTransitionType.leftToRightWithFade));

  /// function to clear fields
  void clearField() => codeController.clear();
  bool isPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: PrimaryBackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocConsumer<SignBloc, SignState>(
        listener: (context, state) {
          if (state is UserCodeCheck) {
            if (state.isCodeTrue) {
              gotoRoleChoice();
            } else {
              clearField();
            }
          }
        },
        builder: (context, state) {
          if (state is UserInputtingCode) {
            return Center(
              child: SizedBox(
                width: screenSize.width * 0.911,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.height * 0.025 / 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Введите код",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: primaryFontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.0125),
                            Text(
                              "Этот код нельзя передавать кому-либо",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontFamily: primaryFontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.025),
                            Align(
                              alignment: Alignment.center,
                              child: TextField(
                                scrollPadding: EdgeInsets.zero,
                                controller: codeController,
                                autofocus: true,
                                showCursor: false,
                                cursorHeight: 26,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xff303030),
                                  fontSize: 20,
                                  fontFamily: primaryFontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.only(
                                      left: screenSize.width * 0.044 / 2),
                                  focusedBorder: primaryInputBorder,
                                  enabledBorder: primaryInputBorder,
                                  focusedErrorBorder: primaryInputBorder,
                                  disabledBorder: primaryInputBorder,
                                  errorBorder: primaryErrorInputBorder,
                                  errorText: isPressed
                                      ? getErrorText(codeController.text)
                                      : null,
                                  errorStyle: const TextStyle(
                                    color: primaryErrorColor,
                                    fontFamily: primaryFontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onSubmitted: (String value) {
                                  setState(() => isPressed = true);
                                  splitCode(value);
                                  applyCode(_code!, _uid!);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.911,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: screenSize.height * 0.025),
                          child: PrimaryButton(
                            color: const Color(0xff6969B3),
                            textColor: Colors.white,
                            shadowColor: Colors.black,
                            title: "Далее",
                            onPressed: () {
                              setState(() => isPressed = true);
                              splitCode(codeController.text);
                              applyCode(_code!, _uid!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
