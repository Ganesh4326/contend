part of 'challenges_analytics_screen_cubit.dart';

@freezed
class ChallengesAnalyticsScreenState with _$ChallengesAnalyticsScreenState {
  const factory ChallengesAnalyticsScreenState.initial({
    List<String>? allAcceptedChallengeIdsList,
    List<Challenge>? allChallenges,
    List<int>? noOfDaysLeft,
    List<double>? percentages,
}) = _Initial;
}
