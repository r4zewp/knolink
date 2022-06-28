part of 'sign_bloc.dart';

abstract class SignState {}

class SignInitialState extends SignState {}

class SignLoading extends SignState {}

class SignError extends SignState {
  String e;
  SignError({required this.e});
}

class UserInputtingCode extends SignState {}

class UserCodeCheck extends SignState {
  bool isCodeTrue;
  UserCodeCheck({required this.isCodeTrue});
}
