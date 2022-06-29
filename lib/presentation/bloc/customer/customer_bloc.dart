import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/repos/customer_repository.dart';
import 'package:knolink/datasources/repos/storage_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerRepository _repo = CustomerRepository();
  SecureStorage _storage = SecureStorage();
  CustomerBloc() : super(CustomerAddingInfo()) {
    on<CustomerChosen>(
      (event, emit) {
        _storage.saveUserType("customer");
        emit(CustomerAddingInfo());
      },
    );
    on<CustomerFilledUname>(
      (event, emit) async {
        try {
          final userPrefs = await _storage.readUserPrefs();
          final res = await _repo.applyCustomer(
            userPrefs["uid"],
            event.uname,
            userPrefs["authCode"],
            userPrefs["phone"],
          );
          if (res is! bool) {
            await _storage.saveUserToken(res.toString());
            await _storage.saveUsername(event.uname);
            await _storage.saveUserType("customer");
            emit(CustomerDone(
              uname: event.uname,
            ));
          } else {
            emit(CustomerError(e: "Unknown Auth Error"));
          }
        } catch (e) {
          emit(CustomerError(e: e.toString()));
        }
      },
    );
  }
}
