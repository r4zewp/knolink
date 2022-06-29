import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/presentation/Auth/AuthMain.dart';
import '../Utils/PrimaryButton.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/sign/sign_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    /// MEDIAQUERY
    Size screenSize = MediaQuery.of(context).size;
    double logoWidth = screenSize.width * 0.533;
    double logoHeight = screenSize.height * 0.246;
    double mainContainer = screenSize.width * 0.911;
    double sizedSpacer = screenSize.height * 0.0125 * 2;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: mainContainer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: logoWidth,
                height: logoHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/img/logo_splash_white.png'),
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      color: const Color(0xff6969B3),
                      textColor: Colors.white,
                      shadowColor: Colors.black,
                      title: "Войти",
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => AuthBloc(),
                                ),
                                BlocProvider(
                                  create: (context) => SignBloc(),
                                ),
                              ],
                              child: const AuthMain(),
                            ),
                          ),
                        );
                      },
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
