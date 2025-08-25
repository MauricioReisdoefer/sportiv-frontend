import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterNameChanged>((event, emit) { // Atualiza campo ".name"
      emit(state.copyWith(name: event.name));
    });

    on<RegisterEmailChanged>((event, emit) { // Atualiza campo ".email"
      emit(state.copyWith(email: event.email));
    });

    on<RegisterDateChanged>((event, emit) { // Atualiza campo ".date"
      emit(state.copyWith(date: event.date));
    });

    on<RegisterStateChanged>((event, emit) { // Atualiza campo ".state"
      emit(state.copyWith(state: event.state));
    });

    on<RegisterCityChanged>((event, emit) { // Atualiza campo ".city"
      emit(state.copyWith(city: event.city));
    });

    on<RegisterSubmitted>((event, emit) async { // Atualiza campo ".isSubmitting"
      emit(state.copyWith(isSubmitting: true));

      debugPrint('--- REGISTER SUBMITTED ---');
      debugPrint('Name: ${state.name}');
      debugPrint('Email: ${state.email}');
      debugPrint('Date: ${state.date}');
      debugPrint('State: ${state.state}');
      debugPrint('City: ${state.city}');
      debugPrint('IsSubmitting: ${state.isSubmitting}');
      debugPrint('-------------------------');

      //
      // TODO: INTEGRAR COM API
      //

      emit(state.copyWith(isSubmitting: false));
    });
  }
}
