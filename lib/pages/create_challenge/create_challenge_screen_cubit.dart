import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_challenge_screen_state.dart';

part 'create_challenge_screen_cubit.freezed.dart';

class CreateChallengeScreenCubit extends Cubit<CreateChallengeScreenState> {
  CreateChallengeScreenCubit()
      : super(const CreateChallengeScreenState.initial(
            no_of_tasks: 0, no_of_days: '1 day', privacy: 'PUBLIC'));

  increaseTasks(no_of_tasks) {
    print('CHALL: ' + state.no_of_tasks.toString());
    emit(state.copyWith(no_of_tasks: no_of_tasks + 1));
    print('CHALL: ' + state.no_of_tasks.toString());
  }

  setNoOfDays(String no_of_days) {
    print('DAYS: ' + state.no_of_days!);
    emit(state.copyWith(no_of_days: no_of_days));
    print('DAYS: ' + state.no_of_days!);
  }

  setPrivacy(String privacy) {
    print('PRIVACY: ' + state.privacy!);
    emit(state.copyWith(privacy: privacy));
    print('PRIVACY: ' + state.privacy!);
  }
}
