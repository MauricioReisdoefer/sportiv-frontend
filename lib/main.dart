import 'package:flutter/material.dart';
import 'package:sportiv/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const Sportiv());
}

class Sportiv extends StatelessWidget {
  const Sportiv({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}
