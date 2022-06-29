import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:knolink/presentation/Orders/OrderDetailed.dart';
import 'package:knolink/presentation/bloc/order/order_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../datasources/env/env.dart';
import 'Utils/OrderTile.dart';

class FindOrders extends StatefulWidget {
  const FindOrders({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<FindOrders> createState() => _FindOrdersState();
}

class _FindOrdersState extends State<FindOrders> {
  String dropdownSubjectFirstValue = subjectsList[0];

  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context).add(FindOrdersInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.025),
            child: Center(
              child: SizedBox(
                width: screenSize.width * 0.911,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: DelayedWidget(
                    delayDuration: const Duration(milliseconds: 500),
                    animationDuration: const Duration(milliseconds: 200),
                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (state is FindOrdersAllOrdersReady)
                          if (state.orders.isNotEmpty)
                            Column(
                              children: [
                                SizedBox(
                                  height: screenSize.height * 0.15,
                                  child: Container(
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
                                            dropdownSubjectFirstValue =
                                                variable;
                                          });
                                          if (dropdownSubjectFirstValue !=
                                              "Не выбрано") {
                                            BlocProvider.of<OrderBloc>(context)
                                                .add(
                                              FindBySubjectInitialized(
                                                subject:
                                                    dropdownSubjectFirstValue,
                                              ),
                                            );
                                          } else {
                                            BlocProvider.of<OrderBloc>(context)
                                                .add(FindOrdersInitialized());
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.8,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: state.orders.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) => OrderTile(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                            child: BlocProvider(
                                              create: (context) => OrderBloc(),
                                              child: OrderDetailed(
                                                id: state.orders[index].id,
                                                comment:
                                                    state.orders[index].comment,
                                                fromFind: true,
                                                subject:
                                                    state.orders[index].subject,
                                                price:
                                                    state.orders[index].price!,
                                                status:
                                                    state.orders[index].status,
                                                type: widget.type,
                                              ),
                                            ),
                                            type: PageTransitionType
                                                .leftToRightWithFade,
                                          ),
                                        );
                                      },
                                      type: state.orders[index].type,
                                      title: state.orders[index].subject,
                                      orderType: Icons.wifi,
                                    ),
                                  ),
                                )
                              ],
                            )
                          else
                            DelayedWidget(
                              delayDuration: const Duration(milliseconds: 500),
                              animationDuration:
                                  const Duration(milliseconds: 200),
                              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                              child: SizedBox(
                                height: screenSize.height * 0.8,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Никто не ищет помощи :(",
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
          );
        },
      ),
    );
  }
}
