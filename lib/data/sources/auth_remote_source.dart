import 'package:batur/data/models/sign_in_model.dart';
import 'package:batur/data/models/sign_up_model.dart';
import 'package:batur/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteSource {
  Future<UserCredential> signIn(SignInModel signInModel);
  Future<UserCredential> signUp(SignUpModel signUpModel);
  Future<UserCredential> googleAuthentication();

  Future<User> loadUser();
  Future<String> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteSource {
  final AuthService authService;

  AuthRemoteDataSourceImpl({required this.authService});

  @override
  Future<UserCredential> signIn(SignInModel signIn) async {
    return await authService.signIn(signIn);
  }

  @override
  Future<UserCredential> signUp(SignUpModel signUp) async {
    return await authService.signUp(signUp);
  }

  @override
  Future<UserCredential> googleAuthentication() async {
    return await authService.googleAuthentication();
  }

  @override
  Future<User> loadUser() async {
    return authService.loadUser();
  }

  @override
  Future<String> signOut() async {
    return authService.signOut();
  }
}
