import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/core/api.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  CustomApi client = CustomApi();
  SignBloc() : super(SignInitialState()) {
    on<SignStarted>(
      (event, emit) async {
        emit(SignLoading());
        await Future.delayed(const Duration(milliseconds: 2000), () async {
          try {
            client.launchBot();
            emit(UserInputtingCode());
          } catch (e) {
            emit(SignError(e: e.toString()));
          }
        });
      },
    );
    on<CodeCheckTriggered>(
      (event, emit) async {},
    );
  }
}
