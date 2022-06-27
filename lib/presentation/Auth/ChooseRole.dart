import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/CustomerRoleInfo.dart';
import 'package:knolink/presentation/Auth/TutorRoleInfo.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';
import 'package:knolink/presentation/Utils/PrimaryButton.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({Key? key}) : super(key: key);

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Кто вы?",
          style: TextStyle(
            color: Colors.white,
            fontFamily: primaryFontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
        leading: PrimaryBackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryButton(
              color: Colors.white,
              textColor: Colors.black,
              title: "Заказчик",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CustomerAdd(),
                  ),
                );
              },
            ),
            SizedBox(
              height: screenSize.height * 0.025,
            ),
            PrimaryButton(
              textColor: Colors.black,
              color: Colors.white,
              title: "Исполнитель",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TutorAdd(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
