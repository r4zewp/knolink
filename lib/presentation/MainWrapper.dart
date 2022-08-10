import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/presentation/LoadingWidget.dart';
import 'package:knolink/presentation/Welcome/MainWelcome.dart';
import 'package:knolink/presentation/bloc/profile/profile_bloc.dart';
import 'Home/HomePage.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/order/order_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6969B3),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticatedTutor) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DelayedWidget(
                  delayDuration: const Duration(milliseconds: 200),
                  animationDuration: const Duration(milliseconds: 200),
                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => OrderBloc(),
                      ),
                      BlocProvider(
                        create: (context) => ProfileBloc(),
                      ),
                    ],
                    child: Home(
                      type: "tutor",
                      username: state.uname,
                      university: state.uni,
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is AuthUnauthenticated) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DelayedWidget(
                  delayDuration: const Duration(milliseconds: 200),
                  animationDuration: const Duration(milliseconds: 200),
                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => OrderBloc()),
                      BlocProvider(create: (context) => ProfileBloc()),
                    ],
                    child: Home(
                      type: "customer",
                      username: "locura",
                      university: "none",
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is AuthAuthenticatedCustomer) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DelayedWidget(
                  delayDuration: const Duration(milliseconds: 200),
                  animationDuration: const Duration(milliseconds: 200),
                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                  child: const Welcome(),
                ),
              ),
            );
          }
        },
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
      ),
    );
  }
}
