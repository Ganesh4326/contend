import 'package:bloc/bloc.dart';
import 'package:contend/models/challenge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/blocs/base_cubit.dart';
import '../../core/logger/log.dart';
import '../../services/fire_store.dart';

part 'challenges_analytics_screen_state.dart';

part 'challenges_analytics_screen_cubit.freezed.dart';

class ChallengesAnalyticsScreenCubit
    extends BaseCubit<ChallengesAnalyticsScreenState> {
  ChallengesAnalyticsScreenCubit({required super.context})
      : super(initialState: ChallengesAnalyticsScreenState.initial()) {
    getAllAcceptedChallengesIdsList();
  }

  getAllAcceptedChallengesIdsList() async {
    List<String>? allAcceptedChallengesIds =
        await FireStoreService().getAllAcceptedChallengeIds('');
    emit(state.copyWith(allAcceptedChallengeIdsList: allAcceptedChallengesIds));
    logger.d(state.allAcceptedChallengeIdsList);
    getAllChallengesData();
  }

  getAllChallengesData() async {
    List<Challenge> allChallenges = [];
    for (int i = 0; i < state.allAcceptedChallengeIdsList!.length; i++) {
      Challenge? challenge = await FireStoreService()
          .getChallengeById(state.allAcceptedChallengeIdsList![i]);
      allChallenges.add(challenge!);
    }
    emitState(state.copyWith(allChallenges: allChallenges));
    logger.d(state.allChallenges);
    getNoOfDaysLeft();
  }

  getNoOfDaysLeft() async {
    List<int> list = [];
    for (int i = 0; i < state.allAcceptedChallengeIdsList!.length; i++) {
      int? noOfDaysLeft = await FireStoreService()
          .getNoOfDaysLeft('', state.allAcceptedChallengeIdsList![i]);
      list.add(noOfDaysLeft!);
    }
    emitState(state.copyWith(noOfDaysLeft: list));
    logger.d(state.noOfDaysLeft);
    calculatePercentage();
  }

  int? extractNumber(String input) {
    String number = '';
    for (int i = 0; i < input.length; i++) {
      if (input[i].contains(RegExp(r'[0-9]'))) {
        number += input[i];
      } else {
        break;
      }
    }
    logger.d(number);
    return int.tryParse(number);
  }

  calculatePercentage() {
    List<double> perc = [];

    for (int i = 0; i < state.allAcceptedChallengeIdsList!.length; i++) {
      int noOfDays = 0;
      int? n = extractNumber(state.allChallenges![i].noOfDays);
      if (state.allChallenges![i].noOfDays.contains("month")) {
        noOfDays = n! * 30;
      }
      logger.d(noOfDays);

      double per = (noOfDays - state.noOfDaysLeft![i]) / noOfDays;

      if (!(per.isNaN)) {
        perc.add(per);
      } else {
        perc.add(0);
      }
    }
    emitState(state.copyWith(percentages: perc));
    logger.d(state.percentages!.toList());
  }
}
