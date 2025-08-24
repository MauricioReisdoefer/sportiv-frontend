import 'package:flutter/material.dart';
import 'package:sportiv/features/auth/presentation/pages/login_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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

  Future<void> _selecionarData() async {
    DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (data != null) {
      setState(() {
        _dataController.text =
            "${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
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
                ),
                const SizedBox(height: 16),

                // Email
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Data de Nascimento
              TextField(
                controller: _dataController,
                readOnly: true,
                onTap: _selecionarData,
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
                    _cidadeSelecionada = null; // reset cidade ao mudar estado
                  });
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
                },
              ),
              const SizedBox(height: 40),

              // Botão Cadastrar
              FilledButton(
                  onPressed: () {
                    //
                    // TO DO: lógica de login
                    //
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Avançar'),),
                const SizedBox(height: 16),

              // Já tenho conta
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                },
                child: const Text("Já tenho uma conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
