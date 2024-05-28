import 'package:bloc/bloc.dart';
import 'package:contend/core/blocs/base_cubit.dart';
import 'package:contend/services/fire_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';

part 'create_challenge_screen_cubit.freezed.dart';

part 'create_challenge_screen_state.dart';

class CreateChallengeScreenCubit extends BaseCubit<CreateChallengeScreenState> {
  CreateChallengeScreenCubit({required super.context})
      : super(initialState:  CreateChallengeScreenState.initial(
            no_of_tasks: 0, no_of_days: '1 day', privacy: 'PUBLIC')) {
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emitState(state.copyWith(userId: userId));
  }

  increaseTasks(no_of_tasks) {
    emitState(state.copyWith(no_of_tasks: no_of_tasks + 1));
  }

  setNoOfDays(String no_of_days) {
    emitState(state.copyWith(no_of_days: no_of_days));
  }

  setPrivacy(String privacy) {
    emitState(state.copyWith(privacy: privacy));
  }

  updateChallengesCreated() async {
    await FireStoreService().increaseChallengesCreated(state.userId!);
  }
}
