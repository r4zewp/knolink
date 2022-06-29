part of 'tutor_bloc.dart';

abstract class TutorEvent {}

class TutorChosen extends TutorEvent {}

class TutorFilledUname extends TutorEvent {
  String uname;
  TutorFilledUname({required this.uname});
}

class TutorFilledUni extends TutorEvent {
  String uname;
  String uni;
  TutorFilledUni({required this.uname, required this.uni});
}

