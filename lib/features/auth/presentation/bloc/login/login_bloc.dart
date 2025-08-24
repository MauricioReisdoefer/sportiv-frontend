import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      debugPrint("------------------------");
      debugPrint("LOGIN SUBMITTED");
      debugPrint("------------------------");      
      
      final apiUrl = dotenv.env['API_URL'];
        final username = state.username;
        final password = state.password;

        try {
          final response = await http.post(
            Uri.parse('$apiUrl/login'), // ROTA DEFINIDA NO BACKEND
            headers: {'Content-Type': 'application/json'},
            body: '{"username": "$username", "password": "$password"}',
          );

          if (response.statusCode == 200) {
            debugPrint("Login successful!");
            // TO-DO: SALVAR TOKEN
            // TO-DO: SALVAR TOKEN
            // TO-DO: SALVAR TOKEN
          } else {
            debugPrint("Login failed: ${response.body}");
            // TO-DO: EMITIR ERRO
            // TO-DO: EMITIR ERRO
            // TO-DO: EMITIR ERRO
          }
          } catch (e) {
            debugPrint("Erro ao conectar: $e");
            // TO-DO: EMITIR ERRO
            // TO-DO: EMITIR ERRO
            // TO-DO: EMITIR ERRO
          }


      emit(state.copyWith(isSubmitting: false));
    });
  }
}
