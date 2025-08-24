class LoginState {
  final String username;
  final String password;
  final bool isSubmitting;

  LoginState({
    this.username = '',
    this.password = '',
    this.isSubmitting = false,
  });

  LoginState copyWith({ // Retorna apenas os campos que você quer alterar
    String? username,
    String? password,
    bool? isSubmitting,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
