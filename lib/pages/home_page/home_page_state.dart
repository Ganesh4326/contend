part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial(
      {String? challenge_filter,
      String? userName,
      String? userId,
      bool? isUserExist,
      int? coins,
      List<QueryDocumentSnapshot>? challenges, String? searchTerm}) = _Initial;
}
