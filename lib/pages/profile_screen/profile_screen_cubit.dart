import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/AuthService.dart';
import '../../models/user.dart';
import '../../services/fire_store.dart';

part 'profile_screen_state.dart';

part 'profile_screen_cubit.freezed.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit() : super(const ProfileScreenState.initial()) {
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emit(state.copyWith(userId: userId));
    getUserData();

  }

  getUserData() async {
    Users? user = await FireStoreService().getUserData(state.userId!);
    emit(state.copyWith(userData: user));
  }

  logoutUser() {
    AuthService.removeUserId();
  }
}
