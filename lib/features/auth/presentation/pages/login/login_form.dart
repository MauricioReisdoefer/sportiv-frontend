import 'package:flutter/material.dart';
import 'package:sportiv/features/auth/presentation/pages/register/register_page.dart';
import 'package:sportiv/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:sportiv/features/auth/presentation/bloc/login/login_state.dart';
import 'package:sportiv/features/auth/presentation/bloc/login/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo e textos...
        Icon(Icons.sports_soccer, size: 64, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 16),
        Text('Bem-vindo ao Sportiv', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Entre para continuar', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
        const SizedBox(height: 32),

        // Campo usuário
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return TextField(
              onChanged: (value) => bloc.add(LoginUsernameChanged(value)),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                labelText: 'Usuário ou Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            );
          },
        ),
        const SizedBox(height: 16),

        // Campo senha
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return TextField(
              obscureText: true,
              onChanged: (value) => bloc.add(LoginPasswordChanged(value)),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: 'Senha',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            );
          },
        ),
        const SizedBox(height: 24),

        // Botão entrar
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return FilledButton(
              onPressed: state.isSubmitting
                  ? null
                  : () => bloc.add(LoginSubmitted()),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: state.isSubmitting
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Entrar'),
            );
          },
        ),

        const SizedBox(height: 16),

        // Link de cadastro
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
          child: const Text('Ainda não sou cadastrado'),
        ),
      ],
    );
  }
}
