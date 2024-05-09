import 'package:code_base/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:code_base/base_class/bloc/base_state.dart';
import 'package:flutter/material.dart';
import 'coming_soon_bloc.dart';

class ComingSoonForm extends StatefulWidget {
  const ComingSoonForm({super.key});

  @override
  State<ComingSoonForm> createState() => _ComingSoonFormState();
}

class _ComingSoonFormState
    extends BaseBLocFormStateFull<ComingSoonBloc, ComingSoonForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return Container();
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {}
}
