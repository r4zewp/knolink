import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Auth/Utils/PrimaryBackButton.dart';
import 'package:knolink/presentation/bloc/app/app_bloc.dart';

import 'Utils/ProfileCustomTile.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: PrimaryBackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        title: const Text(
          "Настройки",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 28,
            fontFamily: primaryFontFamily,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => Center(
          child: SizedBox(
            width: screenSize.width * 0.911,
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileCustomTile(
                    onPressed: () {},
                    label: "Вывести средства",
                    isRightArrowNeeded: true,
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
