part of 'sign_bloc.dart';

abstract class SignEvent {}

class SignStarted extends SignEvent {}

class CodeCheckTriggered extends SignEvent {
  String code;
  String uid;
  CodeCheckTriggered({
    required this.code,
    required this.uid,
  });
}
