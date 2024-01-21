import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final bool isLoggedIn;
  final bool isVerifyingEmail;

  const AuthEntity({
    required this.isLoggedIn,
    required this.isVerifyingEmail,
  });

  @override
  List<Object?> get props => [
        isLoggedIn,
        isVerifyingEmail,
      ];
}
