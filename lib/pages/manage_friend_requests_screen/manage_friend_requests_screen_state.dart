part of 'manage_friend_requests_screen_cubit.dart';

@freezed
class ManageFriendRequestsScreenState with _$ManageFriendRequestsScreenState {
  const factory ManageFriendRequestsScreenState.initial({
    List<String>? friendRequests,
    List<Users>? friendRequestsUsers,
    String? userId,
    List<String>? friendRequestNames
}) = _Initial;
}
