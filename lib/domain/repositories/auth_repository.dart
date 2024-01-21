import 'package:batur/domain/entities/sign_in_entity.dart';
import 'package:batur/domain/entities/sign_up_entity.dart';
import 'package:batur/utils/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> signIn(SignInEntity signIn);
  Future<Either<Failure, UserCredential>> signUp(SignUpEntity signUp);
  Future<Either<Failure, UserCredential>> googleSignIn();

  Future<Either<Failure, User>> loadUser();
  Future<Either<Failure, String>> signOut();
}
