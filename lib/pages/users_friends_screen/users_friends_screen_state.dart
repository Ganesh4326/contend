part of 'users_friends_screen_cubit.dart';

@freezed
class UsersFriendsScreenState with _$UsersFriendsScreenState {
  const factory UsersFriendsScreenState.initial({
    List<String>? friendListIds,
    List<Users>? friendListUsers,
    String? userId
}) = _Initial;
}
