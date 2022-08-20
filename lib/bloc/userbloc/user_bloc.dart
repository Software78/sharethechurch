// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharethechurch/utils/global_variables.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>((event, emit) => _loadUser(event, emit));
  }

  _loadUser(LoadUser event, emit) async {
    bool? session = await repository.checkSession();
    session!
        ? () async {
            bool? isIndividual = await repository.isIndividual();
            isIndividual! ? emit(UserIsIndividual()) : emit(UserIsChurch());
          }
        : emit(UserInitial());
  }
}
