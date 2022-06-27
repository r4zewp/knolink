import 'package:flutter/material.dart';
import 'package:knolink/datasources/env/env.dart';

class TutorTile extends StatelessWidget {
  const TutorTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height * 0.025),
      child: Container(
        width: screenSize.width * 0.911,
        height: screenSize.height * 0.12,
        decoration: BoxDecoration(
          color: const Color(0xff6969B3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0.0, 2.0),
              blurRadius: 5.0,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenSize.width * 0.022 * 2,
            screenSize.height * 0.0125,
            screenSize.width * 0.022 * 2,
            screenSize.height * 0.0125,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Помощник 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      fontFamily: primaryFontFamily,
                    ),
                  ),
                  Text(
                    "HSE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: primaryFontFamily,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "4.9",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: primaryFontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
