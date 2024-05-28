part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial(
      {String? challenge_filter,
      List<String>? topChallenges,
      String? userName,
      String? userId,
      bool? isUserExist,
      int? coins,
      List<QueryDocumentSnapshot>? challenges,
      String? searchTerm,
      List<String>? likedChallenges,
      List<Challenge>? likedChallengeList}) = _Initial;
}
