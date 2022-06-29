import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';
import 'package:knolink/presentation/Orders/Utils/TutorTile.dart';
import 'package:knolink/presentation/Utils/PrimaryButton.dart';
import '../bloc/order/order_bloc.dart';

class OrderDetailed extends StatefulWidget {
  const OrderDetailed({
    Key? key,
    required this.subject,
    required this.price,
    required this.status,
    required this.type,
    required this.fromFind,
    this.comment,
    required this.id,
  }) : super(key: key);

  final String subject;
  final String id;
  final String price;
  final String status;
  final String type;
  final bool fromFind;
  final String? comment;

  @override
  State<OrderDetailed> createState() => _OrderDetailedState();
}

class _OrderDetailedState extends State<OrderDetailed> {
  SnackBar successSnackBar = const SnackBar(
    duration: Duration(milliseconds: 1000),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
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

  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: PrimaryBackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          widget.subject,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: primaryFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) => GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SizedBox(
              width: screenSize.width * 0.911,
              child: Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.025),
                child: Column(
                  mainAxisAlignment: widget.type == "customer"
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.025),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, screenSize.width * 0.022, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Статус",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: primaryFontFamily,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28,
                                        ),
                                      ),
                                      SizedBox(
                                          height: screenSize.height * 0.0125),
                                      Container(
                                        height: screenSize.width * 0.15,
                                        width: screenSize.width * 0.45,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff6969B3),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              offset: const Offset(0.0, 2.0),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: screenSize.width * 0.022,
                                              top: screenSize.height * 0.00625),
                                          child: Text(
                                            widget.status == "open"
                                                ? "Активный"
                                                : "Закрытый",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: primaryFontFamily,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              widget.fromFind
                                  ? const SizedBox.shrink()
                                  : Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0.0, 0.0,
                                            screenSize.width * 0.022, 0.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Цена",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: primaryFontFamily,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 28,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    screenSize.height * 0.0125),
                                            Container(
                                              height: screenSize.width * 0.15,
                                              width: screenSize.width * 0.45,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff6969B3),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    offset:
                                                        const Offset(0.0, 2.0),
                                                    blurRadius: 5.0,
                                                  ),
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: screenSize.width *
                                                        0.022,
                                                    top: screenSize.height *
                                                        0.00625),
                                                child: Text(
                                                  widget.price == "null"
                                                      ? "Нет"
                                                      : widget.price,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        primaryFontFamily,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.0125),
                          widget.fromFind
                              ? Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Комментарий",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: primaryFontFamily,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height: screenSize.height * 0.0125),
                                    Row(
                                      children: [
                                        Container(
                                          width: screenSize.width * 0.910,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff6969B3),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                offset: const Offset(0.0, 2.0),
                                                blurRadius: 5.0,
                                              ),
                                            ],
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              screenSize.width * 0.022,
                                              screenSize.height * 0.00625,
                                              screenSize.width * 0.022,
                                              screenSize.height * 0.00625,
                                            ),
                                            child: Text(
                                              widget.comment == ""
                                                  ? "Описание заказа отсутствует."
                                                  : widget.comment!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: primaryFontFamily,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          SizedBox(height: screenSize.height * 0.0125),
                          widget.fromFind
                              ? Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Предложите цену",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: primaryFontFamily,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height: screenSize.height * 0.0125),
                                    SizedBox(
                                      width: screenSize.width * 0.911,
                                      height: screenSize.height * 0.07,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: priceController,
                                              autofocus: false,
                                              showCursor: false,
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: primaryFontFamily,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24,
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: screenSize.width *
                                                        0.022),
                                                enabledBorder:
                                                    primaryPurpleInputBorder,
                                                focusedBorder:
                                                    primaryPurpleInputBorder,
                                                focusedErrorBorder:
                                                    primaryPurpleInputBorder,
                                                filled: true,
                                                fillColor:
                                                    const Color(0xff6969B3),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    if (widget.type == "customer")
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Помощники",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: primaryFontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                            ),
                          ),
                          if (state is DetailedOrderForCustomer)
                            ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  const TutorTile(),
                            )
                          else
                            const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  color: const Color(0xff6969B3),
                                  textColor: Colors.white,
                                  shadowColor: Colors.black,
                                  title: "Откликнуться",
                                  onPressed: () async {
                                    BlocProvider.of<OrderBloc>(context).add(
                                        FollowOrderByTutor(
                                            oid: widget.id,
                                            price: priceController.text));
                                    ScaffoldMessengerState()
                                        .showSnackBar(successSnackBar);
                                    await Future.delayed(
                                        const Duration(milliseconds: 1200), () {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                              )
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
      ),
    );
  }
}
