import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/services/fire_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';
import '../../core/logger/log.dart';

part 'home_page_state.dart';

part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit()
      : super(const HomePageState.initial(
            challenge_filter: 'ALL', userId: '', isUserExist: false)) {
    getUserId();
    getUserNameFromFirebase();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emit(state.copyWith(userId: userId));
    getUserCoins();

  }

  getUserCoins() async {
    int coins = await FireStoreService().getUserCoins(state.userId!);
    emit(state.copyWith(coins: coins));
  }

  getUserNameFromFirebase() async {
    String? userId = await AuthService.getUserId();
    logger.d(userId);
    String userName = await FireStoreService().getUserNameFromFirebase(userId!);
    logger.d(AuthService.getUserId().toString());
    emit(state.copyWith(userName: userName));
  }

  changeChallengeFilter(String challenge_filter) {
    emit(state.copyWith(challenge_filter: challenge_filter));
    print(challenge_filter);
  }

  logoutUser() {
    AuthService.removeUserId();
  }
}
