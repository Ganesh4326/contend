import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/services/fire_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';
import '../../core/logger/log.dart';
import '../../models/challenge.dart';

part 'challenge_screen_state.dart';

part 'challenge_screen_cubit.freezed.dart';

class ChallengeScreenCubit extends Cubit<ChallengeScreenState> {
  ChallengeScreenCubit({String? challengeId})
      : super(ChallengeScreenState.initial(
            userId: '',
            joined: false,
            checkChallenge: false,
            challengeId: challengeId,
            allAcceptedChallengeIdsList: [],
  likedChallenges: [])) {
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emit(state.copyWith(userId: userId));

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
    emit(state.copyWith(daily_challenges: dailyChallenges));
  }

  getUserLikedChallenges() async {
    List<String> likedChallenges =
        await FireStoreService().getUserLikedChallenges(state.userId!);
    emit(state.copyWith(likedChallenges: likedChallenges));
    logger.d(state.likedChallenges!.toList());
  }

  isJoined(String? userId, String challengeId, String challengeUserId) async {
    emit(state.copyWith(userId: await AuthService.getUserId()));
    emit(state.copyWith(
        joined: await FireStoreService()
            .hasUserJoinedChallenge(userId!, challengeId)));
    print("CHALLENGEID: " + challengeId);
    print("USER ID: " + state.userId!);
    print("CH USER ID:" + challengeUserId);
    print("JOINED: " + state.joined.toString()!);
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
    emit(state.copyWith(checkChallenge: value));
  }

  getNoOfDaysLeft() async {
    int noOfDaysLeft =
        await FireStoreService().getNoOfDaysLeft(state.userId!, state.challengeId!);
    emit(state.copyWith(noOfDaysLeft: noOfDaysLeft));
  }

  getAllAcceptedChallengesIdsList() async {
    List<String>? allAcceptedChallengesIds =
        await FireStoreService().getAllAcceptedChallengeIds(state.userId!);
    emit(state.copyWith(allAcceptedChallengeIdsList: allAcceptedChallengesIds));
  }

  addToAcceptedChallenges(String challengeId, int noOfDaysLeft) {
    FireStoreService().addToAcceptedChallenge(state.userId!, challengeId, noOfDaysLeft);
  }

  addToLikedChallenges(String challengeId) {
    FireStoreService().addToLikedChallenges(state.userId!, challengeId);
  }

  removeFromLikedChallenges(String challengeId) {
    FireStoreService().removeChallengeFromLikedChallenges(state.userId!, challengeId);
  }

// removeChallengeFromAcceptedChallenges(String challengeId) {
//   FireStoreService().removeChallengeFromAcceptedChallenges("", challengeId);
// }
}
