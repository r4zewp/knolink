import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';
import 'package:knolink/presentation/Profile/Settings.dart';
import 'Utils/ProfileCustomTile.dart';

class CustomerProfile extends StatefulWidget {
  CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SizedBox(
          width: screenSize.width * 0.911,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: screenSize.width * 0.27,
                          height: screenSize.height * 0.14,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff6969B3),
                          ),
                        ),
                        Container(
                          width: screenSize.width * 0.22,
                          height: screenSize.height * 0.125,
                          decoration: const BoxDecoration(
                            color: Color(0xff533A7B),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/logo_splash_white.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenSize.width * 0.044,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "locuraa",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: primaryFontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            "Я - счастливый пользователь Knolink",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: primaryFontFamily,
                              fontWeight: FontWeight.w700,
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
                child: Column(
                  children: [
                    ProfileCustomTile(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                      label: "Настройки",
                      isRightArrowNeeded: true,
                    ),
                    ProfileCustomTile(
                      onPressed: () {},
                      label: "О приложении",
                      isRightArrowNeeded: true,
                    ),
                    ProfileCustomTile(
                      onPressed: () {},
                      label: "Моя статистика",
                      isRightArrowNeeded: true,
                    ),
                    ProfileCustomTile(
                      onPressed: () {},
                      label: "Донаты",
                      isRightArrowNeeded: true,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
