import 'package:batur/domain/repositories/auth_repository.dart';
import 'package:batur/utils/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoadUserUseCase {
  final AuthRepository repository;

  LoadUserUseCase(this.repository);

  Future<Either<Failure, User>> execute() async {
    return await repository.loadUser();
  }
}
