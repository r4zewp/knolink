part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthUninitialized extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticatedTutor extends AuthState {
  String uni;
  String uname;
  AuthAuthenticatedTutor({required this.uni, required this.uname});
}

class AuthAuthenticatedCustomer extends AuthState {
  String uname;
  AuthAuthenticatedCustomer({required this.uname});
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {}
