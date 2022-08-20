part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterSuccess extends RegisterState {}
