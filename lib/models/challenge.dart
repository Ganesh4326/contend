class Challenge {
  String challengeId;
  String userId;
  String challengeTitle;
  String creatorName;
  String noOfDays;
  int noOfTasks;
  int noOfPeopleJoined;
  int noOfPeopleCompleted;
  int noOfCoins;
  String task1;
  String task2;
  String task3;
  String task4;
  String task5;
  String task6;
  String task7;
  String privacy;
  int noOflikes;
  int noOfshares;
  String about;

  Challenge({
    required this.userId,
    required this.challengeTitle,
    required this.creatorName,
    required this.noOfDays,
    required this.noOfTasks,
    required this.noOfPeopleCompleted,
    required this.noOfPeopleJoined,
    required this.noOfCoins,
    required this.task1,
    required this.task2,
    required this.task3,
    required this.task4,
    required this.task5,
    required this.task6,
    required this.task7,
    required this.privacy,
    required this.noOflikes,
    required this.noOfshares,
    required this.challengeId,
    required this.about,
  });

  factory Challenge.fromMap(Map<String, dynamic> data) {
    return Challenge(
      challengeId: data['challengeId'] ?? '',
      creatorName: data['creatorName'] ?? '',
      challengeTitle: data['challengeTitle'] ?? '',
      userId: data['userId'] ?? '',
      noOfDays: data['noOfDays']?.toString() ?? '',
      noOfPeopleCompleted: data['noOfPeopleCompleted'] ?? 0,
      noOfTasks: data['noOfTasks'] ?? 0,
      noOfPeopleJoined: data['noOfPeopleJoined'] ?? 0,
      noOfCoins: data['noOfCoins'] ?? 0,
      task1: data['task1'] ?? '',
      task2: data['task2'] ?? '',
      task3: data['task3'] ?? '',
      task4: data['task4'] ?? '',
      task5: data['task5'] ?? '',
      task6: data['task6'] ?? '',
      task7: data['task7'] ?? '',
      privacy: data['privacy'] ?? '',
      noOflikes: data['noOfLikes'] ?? 0,
      about: data['about'] ?? '',
      noOfshares: data['noOfshares'] ?? 0,
    );
  }

}
