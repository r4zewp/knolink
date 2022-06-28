import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/models/Tutor.dart';
import 'package:knolink/datasources/repos/storage_repository.dart';
import 'package:knolink/datasources/repos/tutor_repository.dart';
part 'tutor_event.dart';
part 'tutor_state.dart';

class TutorBloc extends Bloc<TutorEvent, TutorState> {
  final TutorRepository _repo = TutorRepository();
  final SecureStorage _storage = SecureStorage();
  TutorBloc() : super(TutorAddingInfo()) {
    on<TutorChosen>(
      (event, emit) {
        emit(TutorAddingInfo());
      },
    );
    on<TutorFilledUname>(
      (event, emit) {
        emit(TutorSavedUname(uname: event.uname));
      },
    );
    on<TutorFilledUni>(
      (event, emit) async {
        try {
          final userPrefs = await _storage.readUserPrefs();
          final res = _repo.applyTutor(userPrefs["uid"], event.uname, event.uni,
              userPrefs["authCode"], userPrefs["phone"]);
          if (res is! bool) {
            _storage.saveUserToken(res.toString());
            _storage.saveUsername(event.uname);
            _storage.saveUniversity(event.uni);
            emit(TutorAppHome(uname: event.uname, uni: event.uni));
          } else {
            emit(TutorError(e: "Unexpected auth error"));
          }
        } catch (e) {
          emit(TutorError(e: e.toString()));
        }
      },
    );
  }
}
