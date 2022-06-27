import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';
import 'package:knolink/presentation/Orders/Utils/TutorTile.dart';

class OrderDetailed extends StatefulWidget {
  const OrderDetailed({Key? key}) : super(key: key);

  @override
  State<OrderDetailed> createState() => _OrderDetailedState();
}

class _OrderDetailedState extends State<OrderDetailed> {
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
        title: const Text(
          "ТВиМС",
          style: TextStyle(
            color: Colors.white,
            fontFamily: primaryFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: SizedBox(
            width: screenSize.width * 0.911,
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                    ],
                  ),
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
                      ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => TutorTile()),
                    ],
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
