import 'package:batur/data/models/sign_in_model.dart';
import 'package:batur/data/models/sign_up_model.dart';
import 'package:batur/utils/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signIn(SignInModel signIn) async {
    try {
      await firebaseInstance.currentUser?.reload();
      return await firebaseInstance.signInWithEmailAndPassword(
        email: signIn.email,
        password: signIn.password,
      );
    } on FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordException(
        message: "Error while Sign In with Email and Password, code: ${e.code}",
      );
    }
  }

  Future<UserCredential> signUp(SignUpModel signUp) async {
    try {
      await firebaseInstance.currentUser?.reload();
      return await firebaseInstance.createUserWithEmailAndPassword(
        email: signUp.email,
        password: signUp.password,
      );
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordException(
        message: "Error while Sign Up with Email and Password, code: ${e.code}",
      );
    }
  }

  Future<UserCredential> googleAuthentication() async {
    await firebaseInstance.currentUser?.reload();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      return await firebaseInstance.signInWithCredential(credential);
    } catch (e) {
      throw GoogleAuthException(
        message: "Error while Google Authentification process",
      );
    }
  }

  Future<User> loadUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.reload();
        return user;
      } on FirebaseAuthException catch (e) {
        throw AuthException(
          message: "Error while Load user with code: ${e.code}",
        );
      } catch (e) {
        throw AuthException(
          message: "Error while Load user",
        );
      }
    } else {
      throw AuthException(
        message: "Error while Load user with code: user-not-found",
      );
    }
  }

  Future<String> signOut() async {
    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return "Success Sign out user";
    } catch (e) {
      throw SignOutException(
        message: "Error while Sign out user",
      );
    }
  }
}
