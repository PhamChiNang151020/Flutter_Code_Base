// * Author: phamchinang
// * Date: 06/02/2025
// * ====================

part of 'home_bloc.dart';

sealed class HomeState extends BaseState {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  bool get isLoading => true;
}

class HomeLoading extends HomeState {
  @override
  bool get isLoading => true;
}

class HomeLoaded extends HomeState {
  final List<Post> posts;
  const HomeLoaded({required this.posts});

  @override
  bool get isLoading => false;
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});

  @override
  String get errorMessage => message;
  @override
  bool get isLoading => false;
}
