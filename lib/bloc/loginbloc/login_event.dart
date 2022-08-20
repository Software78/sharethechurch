part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final LoginInput input;

  const LoginUser({required this.input});

  @override
  List<Object> get props => [input];

}
