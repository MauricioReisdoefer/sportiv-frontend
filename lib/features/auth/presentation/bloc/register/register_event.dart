abstract class RegisterEvent {}

class RegisterNameChanged extends RegisterEvent { // Evento de quando usuário digita o Name
  final String name;
  RegisterNameChanged(this.name);
}

class RegisterEmailChanged extends RegisterEvent { // Evento de quando usuário digita o Email
  final String email;
  RegisterEmailChanged(this.email);
}

class RegisterDateChanged extends RegisterEvent { // Evento de quando usuário altera a Data de Nascimento
  final String date;
  RegisterDateChanged(this.date);
}

class RegisterStateChanged extends RegisterEvent { // Evento de quando usuário altera o Estado
  final String state;
  RegisterStateChanged(this.state);
}

class RegisterCityChanged extends RegisterEvent { // Evento de quando usuário altera a Cidade
  final String city;
  RegisterCityChanged(this.city);
}

class RegisterSubmitted extends RegisterEvent {} // Evento de quando usuário Envia o Formulário
