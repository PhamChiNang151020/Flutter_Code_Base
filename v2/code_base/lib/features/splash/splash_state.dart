part of 'splash_bloc.dart';

@immutable
sealed class SplashState extends BaseState {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  bool get isLoading => true;
}

class SplashInitSuccessful extends SplashState {
  @override
  bool get isLoading => false;
}
