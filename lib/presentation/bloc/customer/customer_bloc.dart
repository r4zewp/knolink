import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/repos/customer_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerRepository repo = CustomerRepository();
  CustomerBloc() : super(CustomerAddingInfo()) {
    on<CustomerChosen>(
      (event, emit) {},
    );
  }
}
