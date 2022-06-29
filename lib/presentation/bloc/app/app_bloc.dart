import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppRoleUninitialized()) {
    on<AppCustomerHome>(
      (event, emit) {
        emit(AppCustomerInitialized());
      },
    );
    on<AppTutorHome>(
      (event, emit) {
        emit(AppTutorInitialized());
      },
    );
  }
}
