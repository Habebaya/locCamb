import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

abstract class AuthDataSource {
  // Future<UserModel> loginWithEmailAndPassword(String email, String password);
  Future<String> registerWithEmail(String email, String password);
}

class AuthRemoteDataSource implements AuthDataSource {
  // @override
  // Future<UserModel> loginWithEmailAndPassword(String email, String password) async {
  //   // final response = await apiHelper.post(ApiConstants.loginPrefix, {
  //   //   'username': email,
  //   //   'password': password,
  //   // });
  //   // if (ResponseStatus.isSuccessful(response)) {
  //   //   return UserModel.fromJson(response.data);
  //   // }
  //   //
  //   // throw Failure(response.data['error_description']);
  // }

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
        print('The password provided is too weak.');
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
