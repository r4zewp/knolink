import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/repos/storage_repository.dart';
import 'package:knolink/datasources/repos/tutor_repository.dart';
part 'tutor_event.dart';
part 'tutor_state.dart';

class TutorBloc extends Bloc<TutorEvent, TutorState> {
  final TutorRepository _repo = TutorRepository();
  final SecureStorage _storage = SecureStorage();

  /// saving tutor prefs
  void saveTutorPrefs(String res, TutorFilledUni event) {
    _storage.saveUserToken(res.toString());
    _storage.saveUsername(event.uname);
    _storage.saveUniversity(event.uni);
  }

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
        final userPrefs = await _storage.readUserPrefs();
        final id = userPrefs["uid"];
        final authCode = userPrefs["authCode"];
        final phone = userPrefs["phone"];
        final res =
            await _repo.applyTutor(id, event.uname, event.uni, authCode, phone);

        if (res is! bool) {
          _storage.saveUserToken(res);
          _storage.saveUserType("tutor");
          saveTutorPrefs(res, event);
          emit(TutorAppHome(uname: event.uname, uni: event.uni));
        } else {
          print(res);
        }
      },
    );
  }
}
