import 'package:flutter/material.dart';
import 'package:sportiv/features/auth/presentation/pages/login/login_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Sportiv());
}

class Sportiv extends StatelessWidget {
  const Sportiv({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportiv',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}
