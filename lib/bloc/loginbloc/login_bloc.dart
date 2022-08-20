// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharethechurch/utils/utils.dart';

import '../../models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginUser>((event, emit) => _loginUser(event, emit));
  }

  _loginUser(LoginUser event, emit) async {
    emit(const LoginLoading());
    LoginResponse response =
        await repository.loginUser(event.input.username, event.input.password);
    response.status
        ? emit(const LoginSuccess())
        : emit(LoginError(response: response));
  }
}
