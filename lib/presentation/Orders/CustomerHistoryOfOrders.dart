import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:knolink/presentation/bloc/order/order_bloc.dart';

import '../../datasources/env/env.dart';
import 'OrderDetailed.dart';
import 'Utils/OrderTile.dart';

class CustomerOrdersHistory extends StatefulWidget {
  const CustomerOrdersHistory({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<CustomerOrdersHistory> createState() => _CustomerOrdersHistoryState();
}

class _CustomerOrdersHistoryState extends State<CustomerOrdersHistory> {
  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context)
        .add(HistoryOrdersInitialized(type: widget.type));
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
                    if (state is ClosedOrdersListReady)
                      if (state.closedOrders.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: state.closedOrders.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => OrderTile(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => OrderDetailed(
                                      fromFind: false,
                                      id: state.closedOrders[index].id,
                                      type: widget.type,
                                      subject:
                                          state.closedOrders[index].subject,
                                      price: state.closedOrders[index].price!,
                                      status: state.closedOrders[index].status,
                                    ),
                                  ),
                                );
                              },
                              type: state.closedOrders[index].type,
                              title: state.closedOrders[index].subject,
                              orderType: Icons.wifi,
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
