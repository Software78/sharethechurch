import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharethechurch/models/input/register_input.dart';
import 'package:sharethechurch/models/output/register_response.dart';
import 'package:sharethechurch/utils/utils.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUser>((event, emit) => _registerUser(event, emit));
  }

  _registerUser(RegisterUser event, emit) async {
    emit(RegisterLoading());
    RegisterResponse response = await repository.registerUser(event.input);
    response.status
        ? emit(RegisterSuccess())
        : emit(RegisterError(message: response.message.toString()));
  }
}
