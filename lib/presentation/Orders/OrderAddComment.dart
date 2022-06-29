import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Utils/PrimaryButton.dart';
import 'package:knolink/presentation/bloc/order/order_bloc.dart';

class OrderAddComment extends StatefulWidget {
  const OrderAddComment({Key? key, required this.pagec}) : super(key: key);
  final PageController pagec;
  @override
  State<OrderAddComment> createState() => _OrderAddCommentState();
}

class _OrderAddCommentState extends State<OrderAddComment> {
  TextEditingController comController = TextEditingController();

  SnackBar successSnackBar = const SnackBar(
    duration: Duration(milliseconds: 1000),
    elevation: 2.0,
    backgroundColor: Color(0xff6969B3),
    content: Text(
      "Заказ успешно создан!",
      style: TextStyle(
        color: Colors.white,
        fontFamily: primaryFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) async {
          if (state is OrderCreated) {
            ScaffoldMessengerState().showSnackBar(successSnackBar);
            await Future.delayed(
              const Duration(milliseconds: 1200),
              () => Navigator.of(context).pop(),
            );
          }
        },
        builder: (context, state) => Center(
          child: SizedBox(
            width: screenSize.width * 0.911,
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Комментарий к заказу",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: primaryFontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.0125),
                      SizedBox(
                        width: screenSize.width * 0.911,
                        child: TextField(
                          showCursor: false,
                          autofocus: true,
                          controller: comController,
                          minLines: 1,
                          maxLines: 5,
                          maxLength: 150,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: primaryFontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: screenSize.width * 0.022,
                              bottom: screenSize.width * 0.025,
                            ),
                            counterText: "",
                            helperText: "Не более 150 символов",
                            helperStyle: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: primaryFontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: orderCreateCommentBorder,
                            focusedBorder: orderCreateCommentBorder,
                            errorBorder: orderCreateCommentBorder,
                            focusedErrorBorder: orderCreateCommentBorder,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              onPressed: () {
                                if (state is OrderCreating) {
                                  BlocProvider.of<OrderBloc>(context).add(
                                    OrderCommentAdded(
                                      subject: state.subject,
                                      type: state.type,
                                      comment: comController.text,
                                    ),
                                  );
                                }
                              },
                              color: Color(0xff6969B3),
                              title: "Создать заказ",
                              textColor: Colors.white,
                              shadowColor: Colors.black,
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
      ),
    );
  }
}
