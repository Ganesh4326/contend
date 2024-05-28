import 'package:bloc/bloc.dart';
import 'package:contend/core/blocs/base_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';

part 'accepted_challenges_screen_state.dart';
part 'accepted_challenges_screen_cubit.freezed.dart';

class AcceptedChallengesScreenCubit extends BaseCubit<AcceptedChallengesScreenState> {
  AcceptedChallengesScreenCubit({required super.context}) : super(initialState:  AcceptedChallengesScreenState.initial()){
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emitState(state.copyWith(userId: userId));
  }
}
