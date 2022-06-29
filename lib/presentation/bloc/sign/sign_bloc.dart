import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/core/api.dart';
import 'package:knolink/datasources/repos/storage_repository.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final CustomApi _client = CustomApi();
  final SecureStorage _storage = SecureStorage();
  SignBloc() : super(SignInitialState()) {
    on<SignStarted>(
      (event, emit) async {
        emit(SignLoading());
        await Future.delayed(const Duration(milliseconds: 2000), () async {
          try {
            _client.launchBot();
            emit(UserInputtingCode());
          } catch (e) {
            emit(SignError(e: e.toString()));
          }
        });
      },
    );
    on<CodeCheckTriggered>(
      (event, emit) async {
        try {
          dynamic response = await _client.confirmCode(event.uid, event.code);
          if (response is! bool) {
            _storage.saveUserPrefs(
                response["TelNum"], response["Id"], event.code + event.uid);
            emit(UserCodeCheck(isCodeTrue: true));
          } else {
            emit(UserCodeCheck(isCodeTrue: false));
          }
        } catch (e) {
          emit(SignError(e: e.toString()));
        }
      },
    );
  }
}
