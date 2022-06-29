import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';
import 'package:knolink/presentation/Utils/PrimaryButton.dart';

import '../bloc/order/order_bloc.dart';
import 'OrderAddComment.dart';
import 'OrderAddMainInfo.dart';

class OrderCreate extends StatefulWidget {
  const OrderCreate({Key? key}) : super(key: key);

  @override
  State<OrderCreate> createState() => _OrderCreateState();
}

class _OrderCreateState extends State<OrderCreate>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: PrimaryBackButton(
          onPressed: () {
            if (pageController.page == 0) {
              Navigator.of(context).pop();
            } else {
              pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
              );
            }
          },
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Новый заказ",
          style: TextStyle(
            fontFamily: primaryFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => OrderBloc(),
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            OrderAddMainInfo(pagec: pageController),
            OrderAddComment(pagec: pageController),
          ],
        ),
      ),
    );
  }
}
