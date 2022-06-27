import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/presentation/Auth/AuthCodeConfirm.dart';
import 'package:knolink/presentation/LoadingWidget.dart';

import '../bloc/sign/sign_bloc.dart';

class AuthMain extends StatefulWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  State<AuthMain> createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
  @override
  void initState() {
    BlocProvider.of<SignBloc>(context).add(SignStarted());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignBloc, SignState>(
        builder: (context, state) {
          if (state is UserInputtingCode) {
            return DelayedWidget(
              delayDuration: const Duration(milliseconds: 50),
              animationDuration: const Duration(milliseconds: 200),
              animation: DelayedAnimations.SLIDE_FROM_LEFT,
              child: const CodeConfirm(),
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
