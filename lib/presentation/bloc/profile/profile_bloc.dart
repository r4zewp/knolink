import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/models/Customer.dart';
import 'package:knolink/datasources/models/Tutor.dart';
import 'package:knolink/datasources/repos/customer_repository.dart';
import 'package:knolink/datasources/repos/storage_repository.dart';
import 'package:knolink/datasources/repos/tutor_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CustomerRepository _customerRepo = CustomerRepository();
  final TutorRepository _tutorRepo = TutorRepository();
  final SecureStorage _storage = SecureStorage();

  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfilePageInitialized>(
      (event, emit) async {
        final token = await _storage.readToken();
        if (event.type == "customer") {
          final customer = await _customerRepo.getCustomer(token!);
          emit(ProfileReadyCustomer(customer: customer));
        } else {
          final tutor = await _tutorRepo.getTutor(token!);
          emit(ProfileReadyTutor(tutor: tutor));
        }
      },
    );
  }
}
