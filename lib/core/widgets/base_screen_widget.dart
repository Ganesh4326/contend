import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/base_controller.dart';
import 'base_stateless_widget.dart';

abstract class BaseScreenWidget<T extends BaseController, C extends BlocBase, S>
    extends BaseStatelessWidget<T, C, S> {
  final BuildContext pageContext;
  final GoRouterState goRouterState;

  const BaseScreenWidget(
      {required this.pageContext,
      required this.goRouterState,
      super.controller,
      super.key,
      super.onStateChanged});
}

class GoRouterState {
}
