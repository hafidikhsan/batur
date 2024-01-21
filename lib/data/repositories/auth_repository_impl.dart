import 'package:batur/data/models/sign_in_model.dart';
import 'package:batur/data/models/sign_up_model.dart';
import 'package:batur/data/sources/auth_remote_source.dart';
import 'package:batur/domain/entities/sign_in_entity.dart';
import 'package:batur/domain/entities/sign_up_entity.dart';
import 'package:batur/domain/repositories/auth_repository.dart';
import 'package:batur/utils/exceptions.dart';
import 'package:batur/utils/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;

  AuthRepositoryImpl({required this.authRemoteSource});

  @override
  Future<Either<Failure, UserCredential>> signIn(SignInEntity signIn) async {
    try {
      final signInModel = SignInModel(
        email: signIn.email,
        password: signIn.password,
      );
      final userCredential = await authRemoteSource.signIn(signInModel);
      return Right(userCredential);
    } on SignInWithEmailAndPasswordException catch (e) {
      return Left(SignInWithEmailAndPasswordFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(SignUpEntity signUp) async {
    if (signUp.password != signUp.repeatedPassword) {
      return const Left(UnmatchedPassFailure("Password didn't match"));
    } else {
      try {
        final signUpModel = SignUpModel(
          name: signUp.name,
          email: signUp.email,
          password: signUp.password,
          repeatedPassword: signUp.repeatedPassword,
        );
        final userCredential = await authRemoteSource.signUp(signUpModel);
        return Right(userCredential);
      } on SignUpWithEmailAndPasswordException catch (e) {
        return Left(SignUpWithEmailAndPasswordFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, UserCredential>> googleSignIn() async {
    try {
      final userCredential = await authRemoteSource.googleAuthentication();
      return Right(userCredential);
    } on GoogleAuthException catch (e) {
      return Left(GoogleAuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> loadUser() async {
    try {
      final user = await authRemoteSource.loadUser();
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      final message = await authRemoteSource.signOut();
      return Right(message);
    } on SignOutException catch (e) {
      return Left(SignOutFailure(e.message));
    }
  }
}
