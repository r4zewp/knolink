import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/presentation/LoadingWidget.dart';
import 'package:knolink/presentation/Welcome/MainWelcome.dart';

import 'Home/HomePage.dart';
import 'bloc/auth/auth_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthUninitialized) {
          return DelayedWidget(
            delayDuration: const Duration(milliseconds: 200),
            animationDuration: const Duration(milliseconds: 200),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: const Loading(),
          );
        } else if (state is AuthUnauthenticated) {
          return DelayedWidget(
            delayDuration: const Duration(milliseconds: 200),
            animationDuration: const Duration(milliseconds: 200),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: const Welcome(),
          );
        } else if (state is AuthAuthenticated) {
          return const Home();
        } else if (state is AuthError) {
        } else if (state is AuthLoading) {
          return DelayedWidget(
            delayDuration: const Duration(milliseconds: 200),
            animationDuration: const Duration(milliseconds: 200),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: const Loading(),
          );
        }
        return const Loading();
      },
    );
  }
}
