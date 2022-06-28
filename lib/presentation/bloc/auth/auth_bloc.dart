import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/models/Customer.dart';
import 'package:knolink/datasources/repos/storage_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SecureStorage _storage = SecureStorage();
  AuthBloc() : super(AuthUninitialized()) {
    on<AppStarted>(
      (event, emit) async {
        if (await _storage.hasToken()) {
          emit(AuthUninitialized());
          final userPrefs = await _storage.readUserPrefs();
          if (userPrefs["type"] == "customer") {
            await Future.delayed(const Duration(milliseconds: 2500), () async {
              emit(
                AuthAuthenticatedCustomer(
                  uname: userPrefs["username"],
                ),
              );
            });
          } else if (userPrefs["type"] == "tutor") {
            await Future.delayed(const Duration(milliseconds: 2500), () async {
              emit(
                AuthAuthenticatedTutor(
                  uname: userPrefs["username"],
                  uni: userPrefs["uni"],
                ),
              );
            });
          }
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
    on<LoggedInCustomer>(
      (event, emit) {
        emit(AuthAuthenticatedCustomer(
          uname: event.uname,
        ));
      },
    );
    on<LoggedInTutor>(
      (event, emit) {
        emit(AuthAuthenticatedTutor(uname: event.uname, uni: event.uni));
      },
    );
    on<LoggedOut>(
      (event, emit) {
        _storage.revokeToken();
        emit(AuthUnauthenticated());
      },
    );
  }
}
