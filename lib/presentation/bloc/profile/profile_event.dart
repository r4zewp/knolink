part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfilePageInitialized extends ProfileEvent {
  String type;
  ProfilePageInitialized({required this.type});
}
