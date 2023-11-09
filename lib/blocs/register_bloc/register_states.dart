import 'dart:io';

class RegisterState {
  final String fName;
  final String lName;
  final String email;
  final bool flagProvider;
  final bool flagUser;
  final String providerTagline;
  final String providerDescription;
  const RegisterState({
    this.fName = "",
    this.lName = "",
    this.email = "",
    this.flagProvider = false,
    this.flagUser = false,
    this.providerDescription = "",
    this.providerTagline = "",
  });

  RegisterState copyWith({
    String? fName,
    String? lName,
    String? email,
    bool? flagProvider,
    bool? flagUser,
    String? providerTagline,
    String? providerDescription,
  }) {
    return RegisterState(
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      flagProvider: flagProvider ?? this.flagProvider,
      flagUser: flagUser ?? this.flagUser,
      email: email ?? this.email,
      providerDescription: providerDescription ?? this.providerDescription,
      providerTagline: providerTagline ?? this.providerTagline,
    );
  }
}
