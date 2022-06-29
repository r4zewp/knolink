import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/presentation/bloc/order/order_bloc.dart';

import '../../../datasources/env/env.dart';
import '../Utils/PrimaryButton.dart';

class OrderAddMainInfo extends StatefulWidget {
  const OrderAddMainInfo({Key? key, required this.pagec}) : super(key: key);

  final PageController pagec;

  @override
  State<OrderAddMainInfo> createState() => _OrderAddMainInfoState();
}

class _OrderAddMainInfoState extends State<OrderAddMainInfo> {
  String dropdownSubjectFirstValue = subjectsList[0];
  String dropdownTypeFirstValue = orderTypesList[0];
  TextEditingController commentController = TextEditingController();

  void gotoNextPage() => widget.pagec.animateToPage(
        1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
      );

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width * 0.911,
          child: Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.0125),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Выберите предмет",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: primaryFontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.0125),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0.0, 2.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: const Color(0xff6969B3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              screenSize.width * 0.022,
                              0.0,
                              screenSize.width * 0.022,
                              0.0,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                menuMaxHeight: screenSize.height * 0.5,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: primaryFontFamily,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                dropdownColor: const Color(0xff6969B3),
                                focusColor: Colors.transparent,
                                value: dropdownSubjectFirstValue,
                                items: subjectsList.map(
                                  (String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  },
                                ).toList(),
                                onChanged: (dynamic variable) {
                                  setState(() {
                                    dropdownSubjectFirstValue = variable;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.035),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Выберите тип заказа",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: primaryFontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.0125),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0.0, 2.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: const Color(0xff6969B3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              screenSize.width * 0.022,
                              0.0,
                              screenSize.width * 0.022,
                              0.0,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                menuMaxHeight: screenSize.height * 0.5,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: primaryFontFamily,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                dropdownColor: const Color(0xff6969B3),
                                focusColor: Colors.transparent,
                                value: dropdownTypeFirstValue,
                                items: orderTypesList.map(
                                  (String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  },
                                ).toList(),
                                onChanged: (dynamic variable) {
                                  setState(() {
                                    dropdownTypeFirstValue = variable;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            textColor: Colors.white,
                            color: const Color(0xff6969B3),
                            title: "Далее",
                            shadowColor: Colors.black,
                            onPressed: () {
                              /// TODO: ADD VALIDATION OF FULLFILLMENT
                              BlocProvider.of<OrderBloc>(context).add(
                                OrderMainInfoSaved(
                                  subject: dropdownSubjectFirstValue,
                                  type: dropdownTypeFirstValue,
                                ),
                              );
                              gotoNextPage();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
