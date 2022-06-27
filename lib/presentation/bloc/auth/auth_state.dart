part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthUninitialized extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {}
