// * Author: phamchinang
// * Date: 06/02/2025

// * ====================


part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitHomeEvent extends HomeEvent {}

