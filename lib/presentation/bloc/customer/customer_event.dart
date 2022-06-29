part of 'customer_bloc.dart';

abstract class CustomerEvent {}

class CustomerChosen extends CustomerEvent {}

class CustomerFilledUname extends CustomerEvent {
  String uname;
  CustomerFilledUname({required this.uname});
}
