part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserIsNone extends UserState{}

class UserIsChurch extends UserState {}

class UserIsIndividual extends UserState {}
