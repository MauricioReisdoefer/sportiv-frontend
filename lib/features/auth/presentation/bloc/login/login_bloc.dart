import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginUsernameChanged>((event, emit) {
      debugPrint("------------------------");
      debugPrint("USERNAME CHANGED");
      debugPrint("------------------------");      
      emit(state.copyWith(username: event.username)); // Atualiza campo ".username"
    });

    on<LoginPasswordChanged>((event, emit) {
      debugPrint("------------------------");
      debugPrint("PASSWORD CHANGED");
      debugPrint("------------------------");      
      emit(state.copyWith(password: event.password)); // Atualiza campo ".password"
    });

    on<LoginSubmitted>((event, emit) {
      emit(state.copyWith(isSubmitting: true));
      debugPrint("------------------------");
      debugPrint("LOGIN SUBMITTED");
      debugPrint("------------------------");      
      //
      // TODO: chamar lógica de login ou API
      //
      emit(state.copyWith(isSubmitting: false));
    });
  }
}
