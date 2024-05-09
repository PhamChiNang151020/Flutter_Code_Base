import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

abstract class BaseBLocStateless<bloc extends Bloc<dynamic, baseState>,
    baseState extends BaseBlocState> extends StatelessWidget {
  const BaseBLocStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<bloc, baseState>(
      listener: (context, state) {
        listener(context, state);
      },
      child: BlocBuilder<bloc, baseState>(
        builder: (context, state) {
          return getWidget(context, state);
        },
      ),
    );
  }

  Widget getWidget(BuildContext context, BaseBlocState state);

  void listener(BuildContext context, BaseBlocState state);
}
