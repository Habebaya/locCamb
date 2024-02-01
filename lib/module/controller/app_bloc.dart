import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  bool isLoggedIn = false;

  static AppBloc get(context) => BlocProvider.of(context);

  AppBloc() : super(AppInitial());

  void loggedIn({login}) {
    isLoggedIn = login == false;
    emit(LoggedInState());
  }
  }

