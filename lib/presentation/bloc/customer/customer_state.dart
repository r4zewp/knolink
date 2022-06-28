part of 'customer_bloc.dart';

abstract class CustomerState {}

class CustomerAddingInfo extends CustomerState {}

class CustomerError extends CustomerState {
  String e;
  CustomerError({required this.e});
}

class CustomerLoading extends CustomerState {}

class CustomerDone extends CustomerState {
  String uname;
  CustomerDone({required this.uname});
}
