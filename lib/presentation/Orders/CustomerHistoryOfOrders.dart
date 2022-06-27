import 'package:flutter/material.dart';

import 'Utils/OrderTile.dart';

class CustomerOrdersHistory extends StatefulWidget {
  const CustomerOrdersHistory({Key? key}) : super(key: key);

  @override
  State<CustomerOrdersHistory> createState() => _CustomerOrdersHistoryState();
}

class _CustomerOrdersHistoryState extends State<CustomerOrdersHistory> {
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
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => const OrderTile(
                        title: "Dart",
                        date: "3 cентября",
                        time: "20:45",
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
