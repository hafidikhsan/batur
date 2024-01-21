import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class SignInWithEmailAndPasswordFailure extends Failure {
  const SignInWithEmailAndPasswordFailure(String message) : super(message);
}

class SignUpWithEmailAndPasswordFailure extends Failure {
  const SignUpWithEmailAndPasswordFailure(String message) : super(message);
}

class UnmatchedPassFailure extends Failure {
  const UnmatchedPassFailure(String message) : super(message);
}

class GoogleAuthFailure extends Failure {
  const GoogleAuthFailure(String message) : super(message);
}

class AuthFailure extends Failure {
  const AuthFailure(String message) : super(message);
}

class SignOutFailure extends Failure {
  const SignOutFailure(String message) : super(message);
}
