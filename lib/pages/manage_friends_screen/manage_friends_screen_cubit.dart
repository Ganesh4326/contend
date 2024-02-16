import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/AuthService.dart';
import '../../core/blocs/base_cubit.dart';
import '../../core/logger/log.dart';
import '../../models/user.dart';
import '../../services/fire_store.dart';

part 'manage_friends_screen_state.dart';

part 'manage_friends_screen_cubit.freezed.dart';

class ManageFriendsScreenCubit extends BaseCubit<ManageFriendsScreenState> {
  ManageFriendsScreenCubit({required super.context})
      : super(
            initialState: ManageFriendsScreenState.initial(users: [],
                userNames: [], requests: [],requestUsers: [], friendRequests: [], friendsList: [])) {
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emit(state.copyWith(userId: userId));
    getAllUsers();
    List<String>? friendsList = await FireStoreService().getUserFriendList(state.userId!);
    emitState(state.copyWith(friendsList: friendsList));
    getMyRequests();
    getUserRequestedList();
  }

  getAllUsers() async {
    logger.d('in');
    List<Map<String, dynamic>?> users =
        await FireStoreService().getUsersFromFirestore();
    emitState(state.copyWith(users: users));
    logger.d(users);
  }

  void addToList(String userId) async {
    final List<String> updatedUserNames = List.from(state.userNames ?? []);
    updatedUserNames.add(userId);
    emit(state.copyWith(userNames: updatedUserNames));
    FireStoreService().addUserIdToFriendRequests(userId, state.userId!);
    FireStoreService().addUserIdToMyRequests(state.userId!, userId);
    getUserRequestedList();
    getMyRequests();
  }

  getMyRequests() async {
    emitState(state.copyWith(
        requests:
            await FireStoreService().getUserRequestedList(state.userId!)));
    logger.d(state.requests);
    List<Users> users = [];
    for (int i = 0; i < state.requests!.length; i++) {
      Users? user = await FireStoreService().getUserData(state.requests![i]);
      users.add(user);
    }
    emitState(state.copyWith(requestUsers: users));
    logger.d(state.requestUsers!.toList());
  }

  getUserRequestedList() async {
    emitState(state.copyWith(
        friendRequests:
            await FireStoreService().getUserRequestsForFriend(state.userId!)));
    List<Users> users = [];
    for (int i = 0; i < state.friendRequests!.length; i++) {
      Users? user =
          await FireStoreService().getUserData(state.friendRequests![i]);
      users.add(user);
    }
    emitState(state.copyWith(friendRequestsUsers: users));
  }
}
