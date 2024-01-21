part of 'authentification_bloc.dart';

class AuthentificationState extends Equatable {
  final AuthEnum status;
  final User? user;
  final String email;
  final String fullName;
  final String password;
  final bool passwordDisplay;
  final String passwordRepeat;
  final bool passwordRepeatDisplay;
  final String message;

  const AuthentificationState({
    required this.status,
    required this.user,
    required this.email,
    required this.fullName,
    required this.password,
    required this.passwordDisplay,
    required this.passwordRepeat,
    required this.passwordRepeatDisplay,
    required this.message,
  });

  factory AuthentificationState.initial() {
    return const AuthentificationState(
      status: AuthEnum.init,
      user: null,
      email: "",
      fullName: "",
      password: "",
      passwordDisplay: true,
      passwordRepeat: "",
      passwordRepeatDisplay: true,
      message: "",
    );
  }

  AuthentificationState copyWith({
    AuthEnum? status,
    User? user,
    String? email,
    String? fullName,
    String? password,
    bool? passwordDisplay,
    String? passwordRepeat,
    bool? passwordRepeatDisplay,
    String? message,
  }) {
    return AuthentificationState(
      status: status ?? this.status,
      user: user ?? this.user,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      passwordDisplay: passwordDisplay ?? this.passwordDisplay,
      passwordRepeat: passwordRepeat ?? this.passwordRepeat,
      passwordRepeatDisplay:
          passwordRepeatDisplay ?? this.passwordRepeatDisplay,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        fullName,
        password,
        passwordDisplay,
        passwordRepeat,
        passwordRepeatDisplay,
        message,
      ];
}
