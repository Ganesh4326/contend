import 'package:bloc/bloc.dart';
import 'package:contend/models/challenge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/AuthService.dart';
import '../../core/blocs/base_cubit.dart';
import '../../core/logger/log.dart';
import '../../services/fire_store.dart';

part 'challenges_analytics_screen_state.dart';

part 'challenges_analytics_screen_cubit.freezed.dart';

class ChallengesAnalyticsScreenCubit
    extends BaseCubit<ChallengesAnalyticsScreenState> {
  ChallengesAnalyticsScreenCubit({required super.context})
      : super(
            initialState:
                ChallengesAnalyticsScreenState.initial(percentages: [], noOfDaysLeft: [])) {
    getAllAcceptedChallengesIdsList();
  }

  getAllAcceptedChallengesIdsList() async {
    String? userId = await AuthService.getUserId();
    List<String>? allAcceptedChallengesIds =
        await FireStoreService().getAllAcceptedChallengeIds(userId!);
    emitState(state.copyWith(allAcceptedChallengeIdsList: allAcceptedChallengesIds));
    logger.d(state.allAcceptedChallengeIdsList);
    getAllChallengesData();
  }

  getAllChallengesData() async {
    List<Challenge> allChallenges = [];
    for (int i = 0; i < state.allAcceptedChallengeIdsList!.length; i++) {
      Challenge? challenge = await FireStoreService()
          .getChallengeById(state.allAcceptedChallengeIdsList![i]);
      if (challenge != null) {
        logger.d(i);
        allChallenges.add(challenge);
      }
    }
    emitState(state.copyWith(allChallenges: allChallenges));
    logger.d(state.allChallenges);
    getNoOfDaysLeft();
  }

  getNoOfDaysLeft() async {
    List<int> list = [];
    String? userId = await AuthService.getUserId();
    for (int i = 0; i < state.allAcceptedChallengeIdsList!.length; i++) {
      int? noOfDaysLeft = await FireStoreService()
          .getNoOfDaysLeft(userId!, state.allAcceptedChallengeIdsList![i]);
      list.add(noOfDaysLeft);
    }
    emitState(state.copyWith(noOfDaysLeft: list));
    logger.d(state.noOfDaysLeft);
    calculatePercentage();
  }

  int? extractNumber(String input) {
    RegExp regex = RegExp(r'\d+');
    String matchedDigits =
        regex.allMatches(input).map((match) => match.group(0)!).join('');
    return int.parse(matchedDigits);
  }

  calculatePercentage() {
    List<double> perc = [];

    for (int i = 0; i < state.allAcceptedChallengeIdsList!.length; i++) {
      int? n = extractNumber(state.allChallenges![i].noOfDays);
      if (state.allChallenges![i].noOfDays.contains("month")) {
        n = n! * 30;
      }
      logger.d(n);

      double per = (n! - state.noOfDaysLeft![i]) / n;

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
