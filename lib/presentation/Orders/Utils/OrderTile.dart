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
    required this.orderType,
  }) : super(key: key);

  final String title;
  final String? date;
  final String? time;
  final IconData orderType;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrderDetailed(),
          ),
        );
      },
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
                          Padding(
                            padding: EdgeInsets.only(
                              right: screenSize.width * 0.044,
                              top: screenSize.height * 0.00625,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  date!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: primaryFontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  time!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: primaryFontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
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
                            child: const Text(
                              "Консультация",
                              style: TextStyle(
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
