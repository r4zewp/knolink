import 'package:flutter_bloc/flutter_bloc.dart';
part 'tutor_event.dart';
part 'tutor_state.dart';

class TutorBloc extends Bloc<TutorEvent, TutorState> {
  TutorBloc() : super(TutorAddingInfo()) {
    on<TutorChosen>(
      (event, emit) {},
    );
  }
}
