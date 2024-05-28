import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/core/blocs/base_cubit.dart';
import 'package:contend/services/fire_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';
import '../../core/logger/log.dart';
import '../../models/challenge.dart';

part 'challenge_screen_state.dart';

part 'challenge_screen_cubit.freezed.dart';

class ChallengeScreenCubit extends BaseCubit<ChallengeScreenState> {
  ChallengeScreenCubit({required super.context, String? challengeId})
      : super(initialState:ChallengeScreenState.initial(
            userId: '',
            joined: false,
            checkChallenge: false,
            challengeId: challengeId,
            allAcceptedChallengeIdsList: [],
            noOfDaysLeft: 100000,
            daily_challenges: [],
            likedChallenges: [])) {
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emitState(state.copyWith(userId: userId));

    bool joined = await FireStoreService().hasUserJoinedChallenge(
      state.userId!,
      state.challengeId!,
    );
    getUserDailyChallenges();
    getNoOfDaysLeft();
    getAllAcceptedChallengesIdsList();
    getUserLikedChallenges();
  }

  getUserDailyChallenges() async {
    List<String> dailyChallenges =
        await FireStoreService().getUserDailyChallenges(state.userId!);
    emitState(state.copyWith(daily_challenges: dailyChallenges));
  }

  getUserLikedChallenges() async {
    List<String> likedChallenges =
        await FireStoreService().getUserLikedChallenges(state.userId!);
    emitState(state.copyWith(likedChallenges: likedChallenges));
    logger.d(state.likedChallenges!.toList());
  }

  isJoined(String? userId, String challengeId, String challengeUserId) async {
    emitState(state.copyWith(userId: await AuthService.getUserId()));
    emitState(state.copyWith(
        joined: await FireStoreService()
            .hasUserJoinedChallenge(userId!, challengeId)));
  }

  joinChallenge(String? userId, String challengeId) async {
    // String userId = 'user123'; // replace with actual user ID
    // String challengeId =
    //     '8806028b-7438-4518-b77a-b2b968ca9861'; // replace with actual challenge ID
    print("USERID:" + userId!);
    print("ChID:" + challengeId);
    await FireStoreService().createChallengeJoin(userId, challengeId);
    print("JOINED:");
  }

  changeCheckChallenge(bool? value) {
    emitState(state.copyWith(checkChallenge: value));
  }

  getNoOfDaysLeft() async {
    int noOfDaysLeft = await FireStoreService()
        .getNoOfDaysLeft(state.userId!, state.challengeId!);
    emitState(state.copyWith(noOfDaysLeft: noOfDaysLeft));
    logger.d(state.noOfDaysLeft);
  }

  getAllAcceptedChallengesIdsList() async {
    List<String>? allAcceptedChallengesIds =
        await FireStoreService().getAllAcceptedChallengeIds(state.userId!);
    emitState(state.copyWith(allAcceptedChallengeIdsList: allAcceptedChallengesIds));
  }

  addToAcceptedChallenges(String challengeId, int noOfDaysLeft) {
    FireStoreService()
        .addToAcceptedChallenge(state.userId!, challengeId, noOfDaysLeft);
  }

  addToLikedChallenges(String challengeId) {
    FireStoreService().addToLikedChallenges(state.userId!, challengeId);
  }

  removeFromLikedChallenges(String challengeId) {
    FireStoreService()
        .removeChallengeFromLikedChallenges(state.userId!, challengeId);
  }

// removeChallengeFromAcceptedChallenges(String challengeId) {
//   FireStoreService().removeChallengeFromAcceptedChallenges("", challengeId);
// }

  deleteChallenge(String challengeId) {
    FireStoreService().deleteChallenge(challengeId);
  }

  updateNoOfPeopleInChallenge(String challengeId){
    FireStoreService().updateChallengeNoOfPeople(challengeId);
  }
}
