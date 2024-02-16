part of 'profile_screen_cubit.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.initial({
    String? userId,
    Users? userData
}) = _Initial;
}
