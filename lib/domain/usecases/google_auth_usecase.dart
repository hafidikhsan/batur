import 'package:batur/domain/repositories/auth_repository.dart';
import 'package:batur/utils/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthUseCase {
  final AuthRepository repository;

  GoogleAuthUseCase(this.repository);

  Future<Either<Failure, UserCredential>> execute() async {
    return await repository.googleSignIn();
  }
}
