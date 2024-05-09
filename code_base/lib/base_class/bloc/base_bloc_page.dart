import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

typedef Create<T> = T Function(BuildContext context);

abstract class BaseBlocPage<bloc extends Bloc<dynamic, dynamic>>
    extends StatelessWidget {
  const BaseBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (isBlocProviderValue()) {
      return BlocProvider<bloc>.value(
        value: myBloc(context),
        child: getForm(),
      );
    } else {
      return BlocProvider<bloc>(
        create: (context) {
          return myBloc(context);
        },
        child: getForm(),
      );
    }
  }

  BaseBlocState get initialState => InitBlocState();

  bloc myBloc(BuildContext context);

  bool isBlocProviderValue() {
    return true;
  }

  Widget getForm();
}
