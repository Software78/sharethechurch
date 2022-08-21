part of 'passwordreset_bloc.dart';

abstract class PasswordresetState extends Equatable {
  const PasswordresetState();

  @override
  List<Object> get props => [];
}

class PasswordresetInitial extends PasswordresetState {}

class PasswordresetLoading extends PasswordresetState {}

class PasswordresetError extends PasswordresetState {
  final String message;

  const PasswordresetError({required this.message});
}

class PasswordresetSuccess extends PasswordresetState {}
