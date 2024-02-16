part of 'challenge_screen_cubit.dart';

@freezed
class ChallengeScreenState with _$ChallengeScreenState {
  const factory ChallengeScreenState.initial(
      {String? userId,
      bool? joined,
      bool? checkChallenge,
      List<String>? daily_challenges,
      int? noOfDaysLeft,
      String? challengeId,
      List<String>? allAcceptedChallengeIdsList,
          List<String>? likedChallenges,}) = _Initial;
}
