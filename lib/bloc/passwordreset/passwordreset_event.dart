part of 'passwordreset_bloc.dart';

abstract class PasswordresetEvent extends Equatable {
  const PasswordresetEvent();

  @override
  List<Object> get props => [];
}

class ResetPassword extends PasswordresetEvent {
  final String email;

const  ResetPassword({required this.email});

 @override
  List<Object> get props => [email];
}
