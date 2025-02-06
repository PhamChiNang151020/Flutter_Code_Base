import 'package:bloc/bloc.dart';
import 'package:code_base/core/base/base_bloc.dart';
import 'package:code_base/core/base/base_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitSplashEvent>(_mapInitState);
  }

  Future<void> _mapInitState(
    InitSplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashInitSuccessful());
  }
}
//  Future<void> _onCheckAuthStatus(
//     InitSplashEvent event,
//     Emitter<SplashState> emit,
//   ) async {
//     await Future.delayed(const Duration(seconds: 2));

//     emit(SplashCompleted());
//   }