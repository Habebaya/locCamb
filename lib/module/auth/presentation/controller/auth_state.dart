part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final RequestState registerState;
  final RequestState loginState;

  final String registerStatus;
  final String loginStatus;


  const AuthState({
    this.registerState = RequestState.loading,
    this.registerStatus = "",
    this.loginState= RequestState.loading,
    this.loginStatus = ""
  });

  @override
  List<Object> get props => [registerStatus, registerState,loginState];
}
