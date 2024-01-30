import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constant/request_state.dart';
import 'package:equatable/equatable.dart';

import '../../domian/use_case/register_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;

  AuthBloc(this.registerUseCase) : super(AuthState()) {
    on<RegisterEvent>((event, emit) async {
      final result = await registerUseCase.execute(event.email, event.password);
      result.fold(
        (l) => emit(const AuthState(registerState: RequestState.error)),
        (r) {
          emit(AuthState(
            registerState: RequestState.loaded,
            registerStatus: r,
          ));
        },
      );
    });
  }
}
