import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

abstract class BaseBLocFormStateFull<bloc extends Bloc<dynamic, BaseBlocState>,
    statefulWidget extends StatefulWidget> extends State<statefulWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<bloc, BaseBlocState>(
      listener: (context, blocState) {
        listener(context, blocState);
      },
      child: BlocBuilder<bloc, BaseBlocState>(
        builder: (context, blocState) {
          return Scaffold(body: SafeArea(child: getWidget(context, blocState)));
        },
      ),
    );
  }

  Widget getWidget(BuildContext context, BaseBlocState state);

  void listener(BuildContext context, BaseBlocState state);

  bloc getBloc() => context.read<bloc>();
}
