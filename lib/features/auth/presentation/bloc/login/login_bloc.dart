import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username)); // Atualiza campo ".username"
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password)); // Atualiza campo ".password"
    });

    on<LoginSubmitted>((event, emit) {
      emit(state.copyWith(isSubmitting: true));
      //
      // TODO: chamar lógica de login ou API
      //
      emit(state.copyWith(isSubmitting: false));
    });
  }
}
