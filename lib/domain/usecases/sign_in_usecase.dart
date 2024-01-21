import 'package:batur/domain/entities/sign_in_entity.dart';
import 'package:batur/domain/repositories/auth_repository.dart';
import 'package:batur/utils/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, UserCredential>> execute(SignInEntity signIn) async {
    return await repository.signIn(signIn);
  }
}
