import 'package:batur/domain/entities/sign_up_entity.dart';
import 'package:batur/domain/repositories/auth_repository.dart';
import 'package:batur/utils/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserCredential>> execute(SignUpEntity signup) async {
    return await repository.signUp(signup);
  }
}
