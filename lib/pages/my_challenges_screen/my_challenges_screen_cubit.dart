import 'package:bloc/bloc.dart';
import 'package:contend/core/blocs/base_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';

part 'my_challenges_screen_state.dart';

part 'my_challenges_screen_cubit.freezed.dart';

class MyChallengesScreenCubit extends BaseCubit<MyChallengesScreenState> {
  MyChallengesScreenCubit({required super.context})
      : super(initialState:  MyChallengesScreenState.initial(
          userName: '',
          userId: '',
        )) {
    getUserName();
  }

  getUserName() async {
    emitState(state.copyWith(userName: await AuthService.getUserName()));
    emitState(state.copyWith(userId: await AuthService.getUserId()));
    print('user :' + state.userId!);
  }
}
