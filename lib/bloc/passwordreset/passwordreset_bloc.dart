import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharethechurch/utils/utils.dart';

import '../../models/models.dart';

part 'passwordreset_event.dart';
part 'passwordreset_state.dart';

class PasswordresetBloc extends Bloc<PasswordresetEvent, PasswordresetState> {
  PasswordresetBloc() : super(PasswordresetInitial()) {
    on<ResetPassword>((event, emit) => _resetPassword(event, emit));
  }

  _resetPassword(ResetPassword event, emit) async {
    emit(PasswordresetLoading());
    ForgotPasswordResponse response =
        await repository.forgotPassword(event.email);
        
    response.status
        ? emit(PasswordresetSuccess())
        : emit(PasswordresetError(message: response.message!));
  }
}
