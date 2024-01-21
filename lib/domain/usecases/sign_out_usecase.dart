import 'package:batur/domain/repositories/auth_repository.dart';
import 'package:batur/utils/failures.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<Either<Failure, String>> execute() async {
    return await repository.signOut();
  }
}
