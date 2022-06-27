import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUninitialized()) {
    on<AppStarted>(
      (event, emit) async {
        /// checking token presence
        emit(AuthUninitialized());
        await Future.delayed(const Duration(milliseconds: 2500), () async {
          emit(AuthUnauthenticated());
        });
      },
    );
  }
}
