part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedInCustomer extends AuthEvent {
  String uname;
  LoggedInCustomer({required this.uname});
}

class LoggedInTutor extends AuthEvent {
  String uname;
  String uni;

  LoggedInTutor({required this.uname, required this.uni});
}

class LoggedOut extends AuthEvent {}
