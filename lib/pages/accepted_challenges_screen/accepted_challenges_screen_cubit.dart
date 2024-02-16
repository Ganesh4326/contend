import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';

part 'accepted_challenges_screen_state.dart';
part 'accepted_challenges_screen_cubit.freezed.dart';

class AcceptedChallengesScreenCubit extends Cubit<AcceptedChallengesScreenState> {
  AcceptedChallengesScreenCubit() : super(const AcceptedChallengesScreenState.initial()){
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emit(state.copyWith(userId: userId));
  }
}
