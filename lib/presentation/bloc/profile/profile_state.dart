part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileReadyTutor extends ProfileState {
  Tutor tutor;
  ProfileReadyTutor({required this.tutor});
}

class ProfileReadyCustomer extends ProfileState {
  Customer customer;
  ProfileReadyCustomer({required this.customer});
}
