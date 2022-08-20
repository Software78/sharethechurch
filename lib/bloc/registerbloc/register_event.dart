part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  final RegisterInput input;

  const RegisterUser({required this.input});
  
  @override
  List<Object> get props => [];
}
