import 'package:flutter/material.dart';
import 'login_form.dart';
import 'package:sportiv/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
