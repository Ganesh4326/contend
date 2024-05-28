import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/AuthService.dart';
import '../../core/blocs/base_cubit.dart';
import '../../core/logger/log.dart';
import '../../models/user.dart';
import '../../services/fire_store.dart';

part 'manage_friend_requests_screen_state.dart';

part 'manage_friend_requests_screen_cubit.freezed.dart';

class ManageFriendRequestsScreenCubit
    extends BaseCubit<ManageFriendRequestsScreenState> {
  ManageFriendRequestsScreenCubit({required super.context})
      : super(
            initialState: ManageFriendRequestsScreenState.initial(
                friendRequests: [],
                friendRequestsUsers: [],
                friendRequestNames: [])) {
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emitState(state.copyWith(userId: userId));
    getUserRequestedList();
  }

  getUserRequestedList() async {
    emitState(state.copyWith(
        friendRequests:
            await FireStoreService().getUserRequestsForFriend(state.userId!)));
    logger.d(state.friendRequests);
    List<String> users = [];
    for (int i = 0; i < state.friendRequests!.length; i++) {
      // Users? user =
      //     await FireStoreService().getUserData(state.friendRequests![i]);
      // users.add(user);
      String? userName = await FireStoreService()
          .getUserNameFromFirebase(state.friendRequests![i]);
      users.add(userName);
    }
    emitState(state.copyWith(friendRequestNames: users));
  }

  addToFriendList(String? userIdToAdd) async {
    FireStoreService().addToFriendList(state.userId!, userIdToAdd!);
    getUserRequestedList();
  }
}
