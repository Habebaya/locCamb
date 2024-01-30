import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<String> loginWithEmailAndPassword(String email, String password);

  Future<String> registerWithEmail(String email, String password);
}

class AuthRemoteDataSource implements AuthDataSource {
  @override
  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    String status = '';
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == ' invalid-email') {
        status = 'No user found for that email.';
        print("No user found for that email");

      } else if (e.code == 'wrong-password') {
        status = 'Wrong password provided for that user.';
        print("Wrong password provided for that user.");
      }
      else{
        status =  "Too many request";
      }
    }
    return status;
  }

  @override
  Future<String> registerWithEmail(
    String email,
    String password,
  ) async {
    String status = '';
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        status = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        status = "The account already exists for that email";
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return status;
  }
}
