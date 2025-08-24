abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent { // Evento de quando usuário digita no campo Username
  final String username;
  LoginUsernameChanged(this.username);
}

class LoginPasswordChanged extends LoginEvent { // Evento de quando usuário digita no campo Password
  final String password;
  LoginPasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {} // Evento de quando usuário Envia Formulário
