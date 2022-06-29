import 'package:flutter/material.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Orders/OrderDetailed.dart';
import 'package:knolink/presentation/Profile/Utils/PrimaryArrowRightButton.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.title,
    this.date,
    this.time,
    required this.type,
    required this.orderType,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String? date;
  final String? time;
  final String? type;
  final IconData orderType;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          screenSize.width * 0.022,
          0.0,
          screenSize.width * 0.022,
          screenSize.height * 0.03,
        ),
        child: Container(
          width: screenSize.width * 0.911,
          height: screenSize.height * 0.15,
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
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: constraints.maxWidth * 0.91,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenSize.width * 0.044,
                              top: screenSize.height * 0.0125,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: primaryFontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenSize.width * 0.044,
                            ),
                            child: Text(
                              type == "" ? "Консультация" : type!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: primaryFontFamily,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          PrimaryArrowRightButton(
                            color: Colors.white,
                            size: 24,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
