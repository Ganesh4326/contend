import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/core/blocs/base_cubit.dart';
import 'package:contend/services/fire_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';
import '../../core/logger/log.dart';
import '../../models/challenge.dart';

part 'home_page_state.dart';

part 'home_page_cubit.freezed.dart';

class HomePageCubit extends BaseCubit<HomePageState> {
  HomePageCubit({required super.context})
      : super(
            initialState: HomePageState.initial(
                challenge_filter: 'ALL',
                userId: '',
                isUserExist: false,
                searchTerm: '',
                likedChallengeList: [],
                topChallenges: ['fGFRgxFVdpoQSkS8hlu9'])) {
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emitState(state.copyWith(userId: userId));
    await getUserLikedChallenges();
    await getUserNameFromFirebase();
    await getUserCoins();
  }

  getUserCoins() async {
    int coins = await FireStoreService().getUserCoins(state.userId!);
    emitState(state.copyWith(coins: coins));
  }

  getUserNameFromFirebase() async {
    String? userId = await AuthService.getUserId();
    logger.d(userId);
    String userName = await FireStoreService().getUserNameFromFirebase(userId!);
    logger.d(AuthService.getUserId().toString());
    emitState(state.copyWith(userName: userName));
  }

  changeChallengeFilter(String challenge_filter) {
    emitState(state.copyWith(challenge_filter: challenge_filter));
    logger.d(state.likedChallengeList);
  }

  logoutUser() {
    AuthService.removeUserId();
  }

  updateSearchTerm(String? searchTerm) {
    logger.d(searchTerm!);
    emitState(state.copyWith(searchTerm: searchTerm));
    logger.d(state.searchTerm!);
  }

  getUserLikedChallenges() async {
    List<String> likedChallenges =
        await FireStoreService().getUserLikedChallenges(state.userId!);
    emitState(state.copyWith(likedChallenges: likedChallenges));
    logger.d(state.likedChallenges!.toList());
  }

  removeFromLikedChallenges(String challengeId) {
    FireStoreService()
        .removeChallengeFromLikedChallenges(state.userId!, challengeId);
  }

  addToLikedChallenges(String challengeId) {
    FireStoreService().addToLikedChallenges(state.userId!, challengeId);
  }
}
