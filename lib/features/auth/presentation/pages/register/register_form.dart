import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportiv/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:sportiv/features/auth/presentation/bloc/register/register_state.dart';
import 'package:sportiv/features/auth/presentation/bloc/register/register_event.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _dataController = TextEditingController();

  String? _estadoSelecionado;
  String? _cidadeSelecionada;

  final List<String> estados = ['SP', 'RJ', 'MG', 'RS', 'PR'];
  final Map<String, List<String>> cidadesPorEstado = {
    'SP': ['São Paulo', 'Campinas', 'Santos'],
    'RJ': ['Rio de Janeiro', 'Niterói', 'Petrópolis'],
    'MG': ['Belo Horizonte', 'Uberlândia', 'Ouro Preto'],
    'RS': ['Porto Alegre', 'Caxias do Sul', 'Pelotas'],
    'PR': ['Curitiba', 'Londrina', 'Maringá'],
  };

  Future<void> _selecionarData(BuildContext context) async {
    DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (data != null) {
      final formatted =
          "${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}";
      _dataController.text = formatted;

      context.read<RegisterBloc>().add(RegisterDateChanged(formatted));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Cadastro",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Nome
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                labelText: 'Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) =>
                  context.read<RegisterBloc>().add(RegisterNameChanged(value)),
            ),
            const SizedBox(height: 16),

            // Email
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) =>
                  context.read<RegisterBloc>().add(RegisterEmailChanged(value)),
            ),
            const SizedBox(height: 20),

            // Data de Nascimento
            TextField(
              controller: _dataController,
              readOnly: true,
              onTap: () => _selecionarData(context),
              decoration: const InputDecoration(
                labelText: "Data de Nascimento",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 20),

            // Estado (Dropdown)
            DropdownButtonFormField<String>(
              value: _estadoSelecionado,
              decoration: const InputDecoration(
                labelText: "Estado",
                border: OutlineInputBorder(),
              ),
              items: estados
                  .map((estado) => DropdownMenuItem(
                        value: estado,
                        child: Text(estado),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _estadoSelecionado = value;
                  _cidadeSelecionada = null;
                });
                context
                    .read<RegisterBloc>()
                    .add(RegisterStateChanged(value ?? ''));
              },
            ),
            const SizedBox(height: 20),

            // Cidade (Dropdown)
            DropdownButtonFormField<String>(
              value: _cidadeSelecionada,
              decoration: const InputDecoration(
                labelText: "Cidade",
                border: OutlineInputBorder(),
              ),
              items: (_estadoSelecionado != null)
                  ? cidadesPorEstado[_estadoSelecionado]!
                      .map((cidade) => DropdownMenuItem(
                            value: cidade,
                            child: Text(cidade),
                          ))
                      .toList()
                  : [],
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value;
                });
                context
                    .read<RegisterBloc>()
                    .add(RegisterCityChanged(value ?? ''));
              },
            ),
            const SizedBox(height: 40),

            // Botão Cadastrar
            FilledButton(
              onPressed: () {
                context.read<RegisterBloc>().add(RegisterSubmitted());
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: state.isSubmitting
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Avançar'),
            ),
            const SizedBox(height: 16),

            // Já tenho conta
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ou vai pro LoginPage
              },
              child: const Text("Já tenho uma conta"),
            ),
          ],
        );
      },
    );
  }
}
