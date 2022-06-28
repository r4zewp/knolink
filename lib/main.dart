import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/presentation/MainWrapper.dart';
import 'package:knolink/presentation/Utils/CustomPageTransitionBuilder.dart';
import 'package:knolink/presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/LoggedDelegate.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AppStarted()),
        ),
      ], child: const Root()));
    },
    blocObserver: LoggedBlocDelegate(),
  );
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: const Color(0xff533A7B),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomTransitionBuilder(),
            TargetPlatform.iOS: CustomTransitionBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainWrapper(),
    );
  }
}
