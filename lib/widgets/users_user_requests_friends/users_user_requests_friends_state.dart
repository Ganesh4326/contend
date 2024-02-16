part of 'users_user_requests_friends_cubit.dart';

@freezed
class UsersUserRequestsFriendsState with _$UsersUserRequestsFriendsState {
  const factory UsersUserRequestsFriendsState.initial({
    List<String>? requests,
    List<String>? friendRequests,
    List<Users>? requestUsers,
    List<Users>? friendRequestsUsers,
    String? userId
}) = _Initial;
}
