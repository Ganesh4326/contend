part of 'manage_friends_screen_cubit.dart';

@freezed
class ManageFriendsScreenState with _$ManageFriendsScreenState {
  const factory ManageFriendsScreenState.initial({
    List<Map<String, dynamic>?>? users,
    List<String>? userNames,
    String? userId,
    List<String>? requests,
    List<String>? friendRequests,
    List<Users>? requestUsers,
    List<Users>? friendRequestsUsers,
    List<String>? friendsList,
}) = _Initial;
}
