import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Utils/PrimaryButton.dart';
import 'package:knolink/presentation/bloc/order/order_bloc.dart';
import 'OrderCreate.dart';
import 'OrderDetailed.dart';
import 'Utils/OrderTile.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context)
        .add(ActiveOrdersInitialized(type: widget.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) => Padding(
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
                    if (state is ActiveOrdersListReady)
                      if (state.activeOrders.isNotEmpty)
                        DelayedWidget(
                          delayDuration: const Duration(milliseconds: 100),
                          animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                          animationDuration: const Duration(milliseconds: 200),
                          child: Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: state.activeOrders.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => OrderTile(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) => OrderBloc(),
                                        child: OrderDetailed(
                                          fromFind: false,
                                          id: state.activeOrders[index].id,
                                          type: widget.type,
                                          subject:
                                              state.activeOrders[index].subject,
                                          price:
                                              state.activeOrders[index].price!,
                                          status:
                                              state.activeOrders[index].status,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                type: state.activeOrders[index].type,
                                title: state.activeOrders[index].subject,
                                orderType: Icons.wifi,
                              ),
                            ),
                          ),
                        )
                      else
                        DelayedWidget(
                          delayDuration: const Duration(milliseconds: 500),
                          animationDuration: const Duration(milliseconds: 200),
                          animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                          child: SizedBox(
                            height: screenSize.height * 0.8,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Заказов еще нет",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: primaryFontFamily,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    else
                      const Expanded(
                        child: SpinKitRotatingPlain(
                          size: 75,
                          color: Colors.white,
                        ),
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
