class SignInWithEmailAndPasswordException implements Exception {
  final String message;

  SignInWithEmailAndPasswordException({required this.message});
}

class SignUpWithEmailAndPasswordException implements Exception {
  final String message;

  SignUpWithEmailAndPasswordException({required this.message});
}

class GoogleAuthException implements Exception {
  final String message;

  GoogleAuthException({required this.message});
}

class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}

class SignOutException implements Exception {
  final String message;

  SignOutException({required this.message});
}

class EmailVerivicationException implements Exception {
  final String message;

  EmailVerivicationException({required this.message});
}

class ConnectionException implements Exception {}
