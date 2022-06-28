import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/core/api.dart';
import 'package:knolink/datasources/repos/storage_repository.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  CustomApi _client = CustomApi();
  SecureStorage _storage = SecureStorage();
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
          dynamic _response = await _client.confirmCode(event.uid, event.code);
          if (_response is! bool) {
            _storage.saveUserPrefs(
                _response["TelNum"], _response["Id"], event.code + event.uid);
            emit(UserCodeCheck(isCodeTrue: true));
          } else {
            emit(UserCodeCheck(isCodeTrue: false));
          }
        } catch (e) {
          print(e.toString());
          emit(SignError(e: e.toString()));
        }
      },
    );
  }
}
