import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_bloc.dart';

abstract class BasePage<B extends BaseBloc> extends StatefulWidget {
  const BasePage({super.key});

  B createBloc();
}

abstract class BasePageState<Page extends BasePage<B>, B extends BaseBloc>
    extends State<Page> {
  late final B bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.createBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context);
}
