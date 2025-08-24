class RegisterState {
  final String name;
  final String email;
  final String date;
  final String state;
  final String city;
  final bool isSubmitting;

  RegisterState({
    this.name = '',
    this.email = '',
    this.date = '',
    this.state = '',
    this.city = '',
    this.isSubmitting = false,
  });

  RegisterState copyWith({ // Retorna apenas os campos que você quer alterar
    String? name,
    String? email,
    String? date,
    String? state,
    String? city,
    bool? isSubmitting,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      date: date ?? this.date,
      state: state ?? this.state,
      city: city ?? this.city,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
