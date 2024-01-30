import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:loccamb/module/home/domian/entities/user.dart';
import 'package:meta/meta.dart';

import '../../../../core/constant/request_state.dart';
import '../../data/models/user_model.dart';
import '../../domian/use_case/getusers_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserUseCase getUserUseCase;
  HomeBloc(this.getUserUseCase) : super(HomeState()) {
    on<GetUserEvent>((event, emit) async {
      final result = await getUserUseCase.execute();
      result.fold(
            (l) => emit(const HomeState(getUsersState: RequestState.error)),
            (r) {
          emit(HomeState(
            getUsersState: RequestState.loaded,
            users: r,
          ));
        },
      );
    });
  }
}
