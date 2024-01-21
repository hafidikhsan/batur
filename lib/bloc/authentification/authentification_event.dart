part of 'authentification_bloc.dart';

abstract class AuthentificationEvent extends Equatable {
  const AuthentificationEvent();

  @override
  List<Object> get props => [];
}

class OnEmailFormChanged extends AuthentificationEvent {
  final String email;
  const OnEmailFormChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class OnFullNameFormChanged extends AuthentificationEvent {
  final String fullName;
  const OnFullNameFormChanged({required this.fullName});

  @override
  List<Object> get props => [fullName];
}

class OnPasswordFormChanged extends AuthentificationEvent {
  final String password;
  const OnPasswordFormChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class OnPasswordRepeatFormChanged extends AuthentificationEvent {
  final String passwordRepeat;
  const OnPasswordRepeatFormChanged({required this.passwordRepeat});

  @override
  List<Object> get props => [passwordRepeat];
}

class OnPasswordDisplayChanged extends AuthentificationEvent {
  const OnPasswordDisplayChanged();

  @override
  List<Object> get props => [];
}

class OnPasswordRepeatDisplayChanged extends AuthentificationEvent {
  const OnPasswordRepeatDisplayChanged();

  @override
  List<Object> get props => [];
}

class OnEmailSignIn extends AuthentificationEvent {
  const OnEmailSignIn();

  @override
  List<Object> get props => [];
}

class OnGoogleAuth extends AuthentificationEvent {
  const OnGoogleAuth();

  @override
  List<Object> get props => [];
}

class OnEmailSignUp extends AuthentificationEvent {
  const OnEmailSignUp();

  @override
  List<Object> get props => [];
}

class OnCleanForm extends AuthentificationEvent {
  const OnCleanForm();

  @override
  List<Object> get props => [];
}
