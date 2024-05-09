import 'package:code_base/base_class/bloc/base_bloc_page.dart';
import 'package:code_base/utils/screen_key.dart';
import 'package:code_base/utils/utils.dart';

import 'coming_soon_bloc.dart';
import 'coming_soon_form.dart';
import 'package:flutter/material.dart';

class ComingSoonPage extends BaseBlocPage<ComingSoonBloc> {
  const ComingSoonPage({super.key});

  @override
  Widget getForm() {
    return const ComingSoonForm();
  }

  @override
  ComingSoonBloc myBloc(BuildContext context) {
    return ComingSoonBloc(initialState, context);
  }
}

gotoComingSoonPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, COMING_SOON_SCREEN, data);
}

ComingSoonPage comingSoonPage(RouteSettings settings) {
  //var type = arguments["field name"];
  return const ComingSoonPage();
}
