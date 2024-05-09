import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc extends Bloc<BaseBlocEvent, BaseBlocState> {
  final BuildContext context;

  BaseBloc(super.initialState, this.context);
}
