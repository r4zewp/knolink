import 'package:flutter/material.dart';
import 'package:knolink/presentation/Utils/PrimaryButton.dart';

import 'OrderCreate.dart';
import 'Utils/OrderTile.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenSize.height * 0.025),
        child: Center(
          child: SizedBox(
            width: screenSize.width * 0.911,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.type == "customer")
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.025),
                      child: SizedBox(
                        height: screenSize.height * 0.069,
                        width: screenSize.width * 0.911,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            screenSize.width * 0.022,
                            0.0,
                            screenSize.width * 0.022,
                            0.0,
                          ),
                          child: PrimaryButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const OrderCreate(),
                                ),
                              );
                            },
                            shadowColor: Colors.black,
                            title: "Новый заказ",
                            color: const Color(0xff6969B3),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => const OrderTile(
                        title: "ТВиМС",
                        date: "24 июня",
                        time: "13:45",
                        orderType: Icons.wifi,
                      ),
                    ),
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
