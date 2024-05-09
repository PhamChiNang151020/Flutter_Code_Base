import 'package:code_base/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:code_base/base_class/bloc/base_state.dart';
import 'package:code_base/common/common.dart';

import 'package:flutter/material.dart';
import 'splash_screen_bloc.dart';

class SplashScreenForm extends StatefulWidget {
  const SplashScreenForm({super.key});

  @override
  State<SplashScreenForm> createState() => _SplashScreenFormState();
}

class _SplashScreenFormState
    extends BaseBLocFormStateFull<SplashScreenBloc, SplashScreenForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return const Center(
      child: Text(
        "SPLASH_SCREEN Nef",
        style: TextStyle(
          fontSize: MySizes.defaultSize,
          color: MyColors.defaultColor,
        ),
      ),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {}
}
