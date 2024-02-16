import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';

part 'my_challenges_screen_state.dart';
part 'my_challenges_screen_cubit.freezed.dart';

class MyChallengesScreenCubit extends Cubit<MyChallengesScreenState> {
  MyChallengesScreenCubit() : super(const MyChallengesScreenState.initial(userName: '',
    userId: '',));

  getUserName() async {
    emit(state.copyWith(userName: await AuthService.getUserName()));
    emit(state.copyWith(userId: await AuthService.getUserId()));
    print('user :' + state.userId!);
  }
}
