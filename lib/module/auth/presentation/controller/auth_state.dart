part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final RequestState registerState;
  final String registerStatus;

  const AuthState({
    this.registerState = RequestState.loading,
    this.registerStatus = "",
  });

  @override
  List<Object> get props => [registerStatus, registerState];
}
