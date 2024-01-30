part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}



class RegisterEvent extends AuthEvent {
  final String email;
  final String password;


  RegisterEvent(this.email,this.password);
}

