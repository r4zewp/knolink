part of 'tutor_bloc.dart';

abstract class TutorState {}

class TutorAddingInfo extends TutorState {}

class TutorLoading extends TutorState {}

class TutorError extends TutorState {
  String e;
  TutorError({required this.e});
}

class TutorSavedUname extends TutorState {
  String uname;
  TutorSavedUname({required this.uname});
}

class TutorAppHome extends TutorState {
  String uname;
  String uni;

  TutorAppHome({required this.uname, required this.uni});
}
