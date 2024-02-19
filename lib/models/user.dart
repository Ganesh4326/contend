import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String userName;
  String emailId;
  String userId;
  String password;
  int noOfChallengesCreated;
  int noOfChallengesAccepted;
  int noOfChallengesCompleted;
  int coins;
  String about;
  List<String>? acceptedChallenges;
  List<String>? dailyChallenges;
  String? address;

  Users(
      {required this.userName,
      required this.userId,
      required this.password,
      required this.noOfChallengesCreated,
      required this.noOfChallengesAccepted,
      required this.noOfChallengesCompleted,
      required this.coins,
      required this.about,
        required this.emailId,
        this.dailyChallenges,
      this.acceptedChallenges,
      this.address});

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userName: map['userName'],
      userId: map['userId'],
      password: map['password'],
      emailId: map['emailId'],
      noOfChallengesCreated: map['noOfChallengesCreated'],
      noOfChallengesAccepted: map['noOfChallengesAccepted'],
      noOfChallengesCompleted: map['noOfChallengesCompleted'],
      coins: map['coins'],
      about: map['about'],
      acceptedChallenges: map['acceptedChallenges'],
      address: map['address'],
      dailyChallenges: map['daily_challenges']
    );
  }

  factory Users.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Users(
      userName: data['userName'],
      userId: data['userId'],
      password: data['password'],
      emailId: data['emailId'],
      noOfChallengesCreated: data['noOfChallengesCreated'],
      noOfChallengesAccepted: data['noOfChallengesAccepted'],
      noOfChallengesCompleted: data['noOfChallengesCompleted'],
      coins: data['coins'],
      about: data['about'],
      acceptedChallenges: (data['acceptedChallenges'] as List<dynamic>?)
          ?.map((dynamic item) => item.toString())
          .toList(),
      address: data['address'],
      dailyChallenges: data['daily_challenges']
    );
  }

}
