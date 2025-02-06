import 'package:code_base/core/base/base_page.dart';
import 'package:code_base/features/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends BasePage<SplashBloc> {
  const SplashPage({super.key});

  @override
  SplashBloc createBloc() => SplashBloc()..add(InitSplashEvent());

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends BasePageState<SplashPage, SplashBloc> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashInitSuccessful) {
            context.go('/home');
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
