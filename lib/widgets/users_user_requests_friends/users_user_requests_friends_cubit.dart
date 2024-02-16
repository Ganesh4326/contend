import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/AuthService.dart';
import '../../core/blocs/base_cubit.dart';
import '../../models/user.dart';
import '../../services/fire_store.dart';


part 'users_user_requests_friends_state.dart';

part 'users_user_requests_friends_cubit.freezed.dart';

class UsersUserRequestsFriendsCubit
    extends BaseCubit<UsersUserRequestsFriendsState> {
  UsersUserRequestsFriendsCubit({required super.context})
      : super(initialState: UsersUserRequestsFriendsState.initial()){
    getUserId();
  }

  getUserId() async {
    String? userId = await AuthService.getUserId();
    emit(state.copyWith(userId: userId));
    getMyRequests();
  }


  getMyRequests() async {
    emitState(state.copyWith(
        requests:
        await FireStoreService().getUserRequestedList(state.userId!)));
    List<Users> users = [];
    for (int i = 0; i < state.requests!.length; i++) {
      Users? user = await FireStoreService().getUserData(state.requests![i]);
      users.add(user);
    }
    emitState(state.copyWith(requestUsers: users));
  }

}
