import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase blocBase, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(blocBase, error, stackTrace);
  }
}
