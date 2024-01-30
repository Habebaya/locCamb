part of 'home_bloc.dart';

@immutable
// abstract class HomeState {}

class HomeState extends Equatable {
  final RequestState getUsersState;
  final List<User> users;


  const HomeState({
    this.getUsersState = RequestState.loading,
    this.users = const[]

  });

  @override
  List<Object> get props => [getUsersState];

}
