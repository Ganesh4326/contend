import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/models/challenge.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/logger/log.dart';
import '../models/ChallengeComment.dart';
import '../models/order.dart';
import '../models/user.dart';

class FireStoreService {
  //get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //CREATE
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //get collection of users
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<String?> createUser(Users user) async {
    print("IN CREATE USER");

    try {
      DocumentReference userRef = await users.add({
        'userName': user.userName,
        'password': user.password,
        'noOfChallengesCreated': user.noOfChallengesCreated,
        'noOfChallengesAccepted': user.noOfChallengesAccepted,
        'noOfChallengesCompleted': user.noOfChallengesCompleted,
        'coins': user.coins,
        'about': user.about,
        'acceptedChallenges': user.acceptedChallenges ?? [],
        'email': user.emailId,
        'dailyChallenges': user.dailyChallenges,
      });

      // Update the userId field with the document ID
      await userRef.update({'userId': userRef.id});
      return userRef.id;
    } catch (e) {
      print('Error creating user: $e');
      throw e;
    }
  }

  //get collection of challenges
  final CollectionReference challenges =
      FirebaseFirestore.instance.collection('challenges');

  Future<String> createChallenge(Challenge challenge) async {
    DocumentReference docRef = await challenges.add({
      'userId': challenge.userId,
      'challengeTitle': challenge.challengeTitle,
      'creatorName': challenge.creatorName,
      'noOfDays': challenge.noOfDays,
      'noOfPeopleJoined': challenge.noOfPeopleJoined,
      'noOfPeopleCompleted': challenge.noOfPeopleCompleted,
      'noOfCoins': challenge.noOfCoins,
      'noOfTasks': challenge.noOfTasks,
      'task1': challenge.task1,
      'task2': challenge.task2,
      'task3': challenge.task3,
      'task4': challenge.task4,
      'task5': challenge.task5,
      'task6': challenge.task6,
      'task7': challenge.task7,
      'privacy': challenge.privacy,
      'noOfLikes': challenge.noOflikes,
      'noOfShares': challenge.noOfshares,
      'challengeId': challenge.challengeId,
      'about': challenge.about,
      'timeStamp': Timestamp.now(),
    });

    await docRef.update({'challengeId': docRef.id});

    return docRef.id;
  }

  Stream<QuerySnapshot> getChallengesStream() {
    return FirebaseFirestore.instance.collection('challenges').snapshots();
  }

  //READ
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  Future<Challenge?> getChallengeById(String challengeId) async {
    try {
      var querySnapshot = await challenges
          .where('challengeId', isEqualTo: challengeId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If there is a document matching the challengeId, return the Challenge
        var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        print('CHALLENGE:');
        return Challenge(
            userId: data['userId'],
            challengeTitle: data['challengeTitle'],
            creatorName: data['creatorName'],
            noOfDays: data['noOfDays'],
            noOfPeopleJoined: data['noOfPeopleJoined'],
            noOfPeopleCompleted: data['noOfPeopleCompleted'],
            noOfCoins: data['noOfCoins'],
            noOfTasks: data['noOfTasks'],
            task1: data['task1'],
            task2: data['task2'],
            task3: data['task3'],
            task4: data['task4'],
            task5: data['task5'],
            task6: data['task6'],
            task7: data['task7'],
            privacy: data['privacy'],
            noOflikes: data['noOfLikes'],
            noOfshares: data['noOfShares'],
            challengeId: data['challengeId'],
            about: data['about']
            // Add other fields as needed
            );
      } else {
        // If no document found, return null
        return null;
      }
    } catch (e) {
      // Handle errors here
      print("Error getting challenge by ID: $e");
      return null;
    }
  }

  //create challenge joinee
  Future<void> createChallengeJoin(String userId, String challengeId) async {
    try {
      var challengeDocument =
          await challenges.where('challengeId', isEqualTo: challengeId).get();

      if (challengeDocument.docs.isNotEmpty) {
        var challengeData =
            challengeDocument.docs.first.data() as Map<String, dynamic>;

        List<String> currentUsers = challengeData['joinedUsers'] ?? [];

        currentUsers.add(userId);

        await challenges.doc(challengeDocument.docs.first.id).update({
          'joinedUsers': currentUsers,
        });
      } else {
        print('Challenge not found.');
      }
    } catch (e) {
      // Handle errors here
      print("Error joining challenge: $e");
    }
  }

  // Retrieve challenges by user ID
  Future<List<Challenge>> getChallengesByUserId(String userId) async {
    try {
      var querySnapshot =
          await challenges.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return Challenge(
              userId: data['userId'],
              challengeTitle: data['challengeTitle'],
              creatorName: data['creatorName'],
              noOfDays: data['noOfDays'],
              noOfPeopleJoined: data['noOfPeopleJoined'],
              noOfPeopleCompleted: data['noOfPeopleCompleted'],
              noOfCoins: data['noOfCoins'],
              noOfTasks: data['noOfTasks'],
              task1: data['task1'],
              task2: data['task2'],
              task3: data['task3'],
              task4: data['task4'],
              task5: data['task5'],
              task6: data['task6'],
              task7: data['task7'],
              privacy: data['privacy'],
              noOflikes: data['noOfLikes'],
              noOfshares: data['noOfShares'],
              challengeId: data['challengeId'],
              about: data['about']);
        }).toList();
      } else {
        print("NO CHALLENGES WITH GIVEN USER ID");
        return [];
      }
    } catch (e) {
      print("Error getting challenges by user ID: $e");
      return [];
    }
  }

  //to check user joined a challenge
  Future<bool> hasUserJoinedChallenge(String userId, String challengeId) async {
    try {
      var challengeDocument = await challenges
          .where('challengeId', isEqualTo: challengeId)
          .limit(1)
          .get();

      if (challengeDocument.docs.isNotEmpty) {
        var challengeData =
            challengeDocument.docs.first.data() as Map<String, dynamic>;
        List<String> joinedUsers =
            (challengeData['joinedUsers'] as List<dynamic>?)?.cast<String>() ??
                [];
        bool userJoined = joinedUsers.contains(userId);

        return userJoined;
      } else {
        return false;
      }
    } catch (e) {
      print("Error checking if user joined challenge: $e");
      return false;
    }
  }

  //create an accepted challenge
  Future<void> addAcceptedChallenge(
      String userId, String challengeId, int noOfDaysLeft) async {
    try {
      final FirebaseFirestore _db = FirebaseFirestore.instance;
      final QuerySnapshot<Map<String, dynamic>> userDataQuery = await _db
          .collection("users")
          .where("userId", isEqualTo: userId)
          .get();

      if (userDataQuery.docs.isNotEmpty) {
        final DocumentSnapshot<Map<String, dynamic>> userData =
            userDataQuery.docs.first;

        List<dynamic> acceptedChallenges = userData['acceptedChallenges'] ?? [];

        if (!acceptedChallenges.contains(challengeId)) {
          acceptedChallenges.add({
            'challengeId': challengeId,
            'noOfDaysLeft': noOfDaysLeft,
          });

          // Update the 'acceptedChallenges' field in Firestore
          await _db.collection("users").doc(userData.id).update({
            'acceptedChallenges': acceptedChallenges,
            'noOfChallengesAccepted': FieldValue.increment(1),
          });

          print('Challenge added successfully.');
        } else {
          print('Challenge already accepted by the user.');
        }
      } else {
        print('User not found.');
      }
    } catch (e) {
      print('Error adding accepted challenge: $e');
    }
  }

  //login
  Future<String> loginUser(String emailId, String password) async {
    print("IN LOGIN USER");

    final FirebaseFirestore _db = FirebaseFirestore.instance;
    logger.d(emailId);
    logger.d(password);

    final QuerySnapshot<Map<String, dynamic>> userQuerySnapshot = await _db
        .collection("users")
        .where("email", isEqualTo: emailId)
        .get();

    if (userQuerySnapshot.docs.isNotEmpty) {
      final userDoc = userQuerySnapshot.docs.first;
      final userData = userDoc.data();

      if (userData['password'] == password) {
        final username = userData['userName'];
        print('Login successful! Welcome, $username');
        return userData['userId'];
      } else {
        print('Incorrect password. Login failed.');
        return '';
      }
    } else {
      print('User not found. Login failed.');
      return '';
    }
  }

  Future<String> getUserName(String userId) async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;

    final QuerySnapshot<Map<String, dynamic>> userQuerySnapshot =
        await _db.collection("users").where("userId", isEqualTo: userId).get();

    if (userQuerySnapshot.docs.isNotEmpty) {
      final userDoc = userQuerySnapshot.docs.first;
      final userData = userDoc.data();
      print(userData['username']);
      return userData['userName'];
    } else {
      print('User not found. Login failed.');
      return '';
    }
  }

  //get accepted challenges
  Future<List<String>> getAcceptedChallengesByUserId(String userId) async {
    try {
      var querySnapshot = await users.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;

        if (userData.containsKey('acceptedChallenges')) {
          dynamic rawChallenges = userData['acceptedChallenges'];

          if (rawChallenges is List<dynamic>) {
            List<String> acceptedChallengeIds = List<String>.from(rawChallenges
                .whereType<Map<String, dynamic>>()
                .map<String>(
                    (challenge) => challenge['challengeId'] as String));

            print('Accepted Challenge IDs: $acceptedChallengeIds');

            return acceptedChallengeIds;
          } else {
            print('Invalid format for acceptedChallenges field.');
            return [];
          }
        } else {
          print('Accepted challenges field not found in user data.');
          return [];
        }
      } else {
        print("NO CHALLENGES FOUND WITH GIVEN USER ID");
        return [];
      }
    } catch (e) {
      print("Error getting challenges by user ID: $e");
      return [];
    }
  }

  Future<void> addChallengeToDailyChallenges(
      String newChallengeId, String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();
      logger.d(userData.data());

      if (userData.exists) {
        List<dynamic>? dailyChallenges = userData['daily_challenges'];
        logger.d(dailyChallenges);

        if (dailyChallenges == null) {
          dailyChallenges = [newChallengeId];
        } else {
          dailyChallenges.add(newChallengeId);
        }
        logger.d(dailyChallenges);

        await userDocRef.update({'daily_challenges': dailyChallenges});
        updateCoins(userId, 10);

        print('Challenge added to daily_challenges successfully');
      } else {
        print('User data not found');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<DocumentSnapshot> getUserData() async {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //
  //   try {
  //     DocumentReference userDocRef =
  //         _firestore.collection('users').doc('OpKHoGrpRis7rhFmymRH');
  //
  //     DocumentSnapshot userData = await userDocRef.get();
  //
  //     return userData;
  //   } catch (e) {
  //     print('Error: $e');
  //     throw e;
  //   }
  // }

  Future<Users> getUserData(String userId) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      QuerySnapshot querySnapshot =
          await usersCollection.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;
        Users user = Users.fromSnapshot(userSnapshot);
        logger.d('User Data: ${user.userName}, ${user.userId}, ${user.coins}');
        return user;
      } else {
        logger.d('User not found');
        return Users(
            userName: '',
            userId: '',
            password: '',
            noOfChallengesCreated: 0,
            noOfChallengesAccepted: 0,
            noOfChallengesCompleted: 0,
            coins: 0,
            about: '',
            emailId: '');
      }
    } catch (e) {
      logger.d('Error retrieving user data: $e');
      return Users(
          userName: '',
          userId: '',
          password: '',
          noOfChallengesCreated: 0,
          noOfChallengesAccepted: 0,
          noOfChallengesCompleted: 0,
          coins: 0,
          about: '',
          emailId: '');
    }
  }

  Future<List<String>> getUserDailyChallenges(String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      Map<String, dynamic>? userMap = userData.data() as Map<String, dynamic>?;

      if (userMap != null && userMap.containsKey('daily_challenges')) {
        // Assuming 'daily_challenges' is a list of strings
        List<String> dailyChallenges =
            List<String>.from(userMap['daily_challenges']);
        return dailyChallenges;
      } else {
        // Return an empty list if 'daily_challenges' is not present or null
        return [];
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<int> getUserCoins(String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    logger.d(userId);

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      Map<String, dynamic>? userMap = userData.data() as Map<String, dynamic>?;

      if (userMap != null && userMap.containsKey('coins')) {
        int coins = userMap['coins'];
        return coins;
      } else {
        return 0;
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<String> getUserNameFromFirebase(String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    logger.d(userId);

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      Map<String, dynamic>? userMap = userData.data() as Map<String, dynamic>?;

      if (userMap != null && userMap.containsKey('userName')) {
        // Assuming 'daily_challenges' is a list of strings
        String userName = userMap['userName'];
        return userName;
      } else {
        // Return an empty list if 'daily_challenges' is not present or null
        return 'empty';
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<void> updateCoins(String userId, int newCoins) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    logger.d(newCoins);

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      int currentCoins = userData['coins'] ?? 0;

      int newCoins = currentCoins + 10;
      logger.d(newCoins);
      await userDocRef.update({'coins': newCoins});

      print('Coins updated successfully');
    } catch (e) {
      print('Error updating coins: $e');
      throw e;
    }
  }

  Future<Orders?> getOrderData(String orderId) async {
    try {
      CollectionReference ordersCollection =
          FirebaseFirestore.instance.collection('orders');

      QuerySnapshot querySnapshot = await ordersCollection
          .where('orderId', isEqualTo: 'tJeIpH4T1b6DNEPYiMa6')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot orderSnapshot = querySnapshot.docs.first;
        // Create an instance of the Order class using the factory method
        Orders order =
            Orders.fromMap(orderSnapshot.data() as Map<String, dynamic>);
        logger.d(order.itemName);
        return order;
      } else {
        print('Order not found');
        return null;
      }
    } catch (e) {
      print('Error retrieving order data: $e');
      return null;
    }
  }

  Future<List<Orders>> getAllOrders() async {
    try {
      CollectionReference ordersCollection =
          FirebaseFirestore.instance.collection('orders');

      QuerySnapshot querySnapshot = await ordersCollection.get();

      List<Orders> orders = [];
      for (QueryDocumentSnapshot orderSnapshot in querySnapshot.docs) {
        Orders order =
            Orders.fromMap(orderSnapshot.data() as Map<String, dynamic>);
        orders.add(order);
      }

      return orders;
    } catch (e) {
      logger.d('Error retrieving orders: $e');
      return [];
    }
  }

  Future<void> reduceDaysLeft(String userId, String challengeId) async {
    logger.d(challengeId);
    try {
      // Get reference to the user document
      final DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Get the current acceptedChallenges list
      final DocumentSnapshot userSnapshot = await userRef.get();
      final List<dynamic> acceptedChallenges =
          userSnapshot['acceptedChallenges'] as List<dynamic>;

      if (acceptedChallenges != null) {
        final Map<String, dynamic> challenge = acceptedChallenges.firstWhere(
            (challenge) => challenge['challengeId'] == challengeId,
            orElse: () => null);

        if (challenge != null) {
          int currentDaysLeft = challenge['noOfDaysLeft'] as int;

          if (currentDaysLeft > 0) {
            challenge['noOfDaysLeft'] = currentDaysLeft - 1;

            await userRef.update({'acceptedChallenges': acceptedChallenges});
            logger.d(
                'Successfully reduced daysLeft for $challengeId for user $userId');
          } else {
            logger.d(
                'Days left already reached 0 for $challengeId for user $userId');
          }
        } else {
          logger.d(
              'User $userId does not have the challenge $challengeId accepted');
        }
      } else {
        logger.d('User $userId does not have any accepted challenges');
      }
    } catch (e) {
      logger.d('Error reducing daysLeft: $e');
    }
  }

  Future<int> getNoOfDaysLeft(String userId, String challengeId) async {
    try {
      // Get reference to the user document
      final DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Get the current acceptedChallenges list
      final DocumentSnapshot userSnapshot = await userRef.get();
      final List<dynamic> acceptedChallenges =
          userSnapshot['acceptedChallenges'] as List<dynamic>;

      if (acceptedChallenges != null) {
        final Map<String, dynamic> challenge = acceptedChallenges.firstWhere(
            (challenge) => challenge['challengeId'] == challengeId,
            orElse: () => null);

        if (challenge != null) {
          int currentDaysLeft = challenge['noOfDaysLeft'] as int;

          return currentDaysLeft;
        } else {
          logger.d(
              'User $userId does not have the challenge $challengeId accepted');
          return 0;
        }
      } else {
        logger.d('User $userId does not have any accepted challenges');
        return 0;
      }
    } catch (e) {
      logger.d('Error reducing daysLeft: $e');
      return 0;
    }
  }

  Future<List<String>> getAllAcceptedChallengeIds(String userId) async {
    try {
      final DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      final DocumentSnapshot userSnapshot = await userRef.get();
      final List<dynamic> acceptedChallenges =
          userSnapshot['acceptedChallenges'] as List<dynamic>;

      if (acceptedChallenges != null) {
        List<String> challengeIds = acceptedChallenges
            .map((challenge) => challenge['challengeId'] as String)
            .toList();
        logger.d(challengeIds.length);
        logger.d(challengeIds[0]!);
        return challengeIds;
      } else {
        print('User $userId does not have any accepted challenges');
        return [];
      }
    } catch (e) {
      print('Error getting challengeIds: $e');
      return [];
    }
  }

  Future<void> addToAcceptedChallenge(
      String userId, String challengeId, int noOfDaysLeft) async {
    try {
      final DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      final DocumentSnapshot userSnapshot = await userRef.get();
      List<dynamic> acceptedChallenges =
          userSnapshot['acceptedChallenges'] as List<dynamic>;

      if (acceptedChallenges == null) {
        acceptedChallenges = [];
      }

      bool challengeExists = acceptedChallenges
          .any((challenge) => challenge['challengeId'] == challengeId);

      if (!challengeExists) {
        acceptedChallenges.add({
          'challengeId': challengeId,
          'noOfDaysLeft': noOfDaysLeft,
        });

        await userRef.update({'acceptedChallenges': acceptedChallenges});
        logger.d('Challenge $challengeId added successfully for user $userId');
      } else {
        logger.d('Challenge $challengeId is already accepted by user $userId');
      }
    } catch (e) {
      logger.d('Error adding challenge: $e');
    }
  }

  //add to liked challenges
  Future<void> addToLikedChallenges(String userId, String challengeId) async {
    try {
      // Get reference to user document
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Update the likedChallenges array field by adding challengeId
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot userSnapshot = await transaction.get(userRef);
        if (userSnapshot.exists) {
          Map<String, dynamic>? userData =
              userSnapshot.data() as Map<String, dynamic>?; // Cast data to Map
          List<dynamic>? likedChallenges =
              userData?['likedChallenges']?.toList() ??
                  []; // Access 'likedChallenges' field
          likedChallenges?.add(challengeId);
          transaction.update(userRef, {'likedChallenges': likedChallenges});
        }
      });

      print('Challenge added to liked challenges successfully');
    } catch (e) {
      print('Error adding challenge to liked challenges: $e');
    }
  }

  //get liked challenges list
  Future<List<String>> getUserLikedChallenges(String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      Map<String, dynamic>? userMap = userData.data() as Map<String, dynamic>?;

      if (userMap != null && userMap.containsKey('likedChallenges')) {
        List<String> dailyChallenges =
            List<String>.from(userMap['likedChallenges']);
        return dailyChallenges;
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  //delete from liked challenges

  Future<void> removeChallengeFromLikedChallenges(
      String? userId, String? challengeId) async {
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot userSnapshot = await transaction.get(userRef);
        if (userSnapshot.exists) {
          Map<String, dynamic>? userData =
              userSnapshot.data() as Map<String, dynamic>?;
          List<dynamic>? likedChallenges =
              userData?['likedChallenges']?.toList() ?? [];
          likedChallenges?.remove(challengeId);
          transaction.update(userRef, {'likedChallenges': likedChallenges});
        }
      });

      print('Challenge removed from liked challenges successfully');
    } catch (e) {
      print('Error removing challenge from liked challenges: $e');
    }
  }

  Future<List<Map<String, dynamic>?>> getUsersFromFirestore() async {
    try {
      QuerySnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      List<Map<String, dynamic>?> users =
          userSnapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
        return doc.data();
      }).toList();

      logger.d(users);

      return users;
    } catch (e) {
      print("Error getting users: $e");
      return [];
    }
  }

  void addUserIdToFriendRequests(String? userId, String userIdToAdd) async {
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Update the user document to add the userId to the friend_requests list
      await userRef.update({
        'friend_requests': FieldValue.arrayUnion([userIdToAdd])
      });

      print('User Id $userIdToAdd added to friend_requests list successfully');
    } catch (e) {
      print('Error adding user Id to friend_requests list: $e');
    }
  }

  void addUserIdToMyRequests(String? userId, String userIdToAdd) async {
    try {
      // Get a reference to the user document in the users collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Update the user document to add the userId to the friend_requests list
      await userRef.update({
        'requests': FieldValue.arrayUnion([userIdToAdd])
      });

      print('User Id $userIdToAdd added to friend_requests list successfully');
    } catch (e) {
      print('Error adding user Id to friend_requests list: $e');
    }
  }

  Future<List<String>> getUserRequestedList(String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      Map<String, dynamic>? userMap = userData.data() as Map<String, dynamic>?;

      if (userMap != null && userMap.containsKey('requests')) {
        List<String> dailyChallenges = List<String>.from(userMap['requests']);
        return dailyChallenges;
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<List<String>> getUserRequestsForFriend(String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      Map<String, dynamic>? userMap = userData.data() as Map<String, dynamic>?;

      if (userMap != null && userMap.containsKey('friend_requests')) {
        List<String> dailyChallenges =
            List<String>.from(userMap['friend_requests']);
        return dailyChallenges;
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  void addToFriendList(String? userId, String userIdToAdd) async {
    logger.d(userId);
    logger.d(userIdToAdd);
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      DocumentReference userRef2 =
          FirebaseFirestore.instance.collection('users').doc(userIdToAdd);

      await userRef.update({
        'friend_list': FieldValue.arrayUnion([userIdToAdd])
      });
      await userRef2.update({
        'friend_list': FieldValue.arrayUnion([userId])
      });

      removeIdFromFriendRequests(userId!, userIdToAdd);

      print('User Id $userIdToAdd added to friend_requests list successfully');
    } catch (e) {
      print('Error adding user Id to friend_requests list: $e');
    }
  }

  Future<void> removeIdFromFriendRequests(
      String userId, String userIdRemove) async {
    try {
      // Get a reference to the user document in the users collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userIdRemove);
      DocumentReference userRef2 =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Update the user document to remove the userIdToRemove from the friend_requests list
      await userRef.update({
        'friend_requests': FieldValue.arrayRemove([userId])
      });
      await userRef.update({
        'requests': FieldValue.arrayRemove([userId])
      });

      await userRef2.update({
        'requests': FieldValue.arrayRemove([userIdRemove])
      });
      await userRef2.update({
        'friend_requests': FieldValue.arrayRemove([userIdRemove])
      });

      print(
          'User Id $userId removed from friend_requests list successfully for user $userIdRemove');
    } catch (e) {
      print('Error removing user Id from friend_requests list: $e');
      throw e; // Throw the error if needed for further handling
    }
  }

  Future<List<String>> getUserFriendList(String userId) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot userData = await userDocRef.get();

      Map<String, dynamic>? userMap = userData.data() as Map<String, dynamic>?;

      if (userMap != null && userMap.containsKey('friend_list')) {
        List<String> friendList = List<String>.from(userMap['friend_list']);
        return friendList;
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<void> addChallengeComment(
      String challengeId, String username, String comment) async {
    try {
      // Query the challenges collection to find documents where challengeId exists in the data
      QuerySnapshot challengeSnapshots = await FirebaseFirestore.instance
          .collection('challenges')
          .where('challengeId', isEqualTo: challengeId)
          .get();

      // Check if any documents with the given challengeId were found
      if (challengeSnapshots.docs.isEmpty) {
        print('No challenge found with ID $challengeId');
        return; // or throw an error if preferred
      }

      // Update the first found challenge document to add the comment to the challenge_comments field
      DocumentReference challengeRef = challengeSnapshots.docs.first.reference;

      // Create a map with the username as key and the comment as value
      Map<String, dynamic> commentMap = {
        username: comment,
      };

      // Update the challenge document to add the comment to the challenge_comments field
      await challengeRef.update({
        'challenge_comments': FieldValue.arrayUnion([commentMap])
      });

      print('Comment added to challenge successfully');
    } catch (e) {
      print('Error adding comment to challenge: $e');
      throw e; // Throw the error if needed for further handling
    }
  }

  Future<List<ChallengeComment>> getChallengeComments(
      String challengeId) async {
    try {
      logger.d('Fetching challenge comments for challengeId: $challengeId');

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('challenges')
          .where('challengeId', isEqualTo: challengeId)
          .get();
      logger.d(querySnapshot);

      if (querySnapshot.docs.isEmpty) {
        logger.d('No challenge found with ID: $challengeId');
        return [];
      }

      final data = querySnapshot.docs.first.data();
      if (data != null &&
          data is Map<String, dynamic> &&
          data.containsKey('challenge_comments')) {
        final comments = data['challenge_comments'] as List<dynamic>;
        logger.d(comments[0]);

        final Map<String, dynamic> commentMap =
            comments[0] as Map<String, dynamic>;
        final String username = commentMap.keys.first;
        final String comment = commentMap.values.first;

        logger.d(username);
        logger.d(comment);
        final challengeComment =
            ChallengeComment(username: username, comment: comment);
        logger.d(challengeComment.username);
        List<ChallengeComment> allComments = [];

        for (int i = 0; i < comments.length; i++) {
          final Map<String, dynamic> commentMap =
              comments[i] as Map<String, dynamic>;
          final String username = commentMap.keys.first;
          final String comment = commentMap.values.first;

          final challengeComment =
              ChallengeComment(username: username, comment: comment);
          allComments.add(challengeComment);
        }

        return allComments;
      } else {
        logger.d('Challenge comments data not found in document');
        return [];
      }
    } catch (e, stackTrace) {
      logger.e('Error getting challenge comments: $e');
      return [];
    }
  }

  Future<void> removeFriendFromFriendList(
      String? userId, String? friendId) async {
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      DocumentReference userRef2 =
          FirebaseFirestore.instance.collection('users').doc(friendId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot userSnapshot = await transaction.get(userRef);
        if (userSnapshot.exists) {
          Map<String, dynamic>? userData =
              userSnapshot.data() as Map<String, dynamic>?;
          List<dynamic>? friendsData = userData?['friend_list']?.toList() ?? [];
          friendsData?.remove(friendId);
          transaction.update(userRef, {'friend_list': friendsData});
        }
      });

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot userSnapshot = await transaction.get(userRef2);
        if (userSnapshot.exists) {
          Map<String, dynamic>? userData =
              userSnapshot.data() as Map<String, dynamic>?;
          List<dynamic>? friendsData = userData?['friend_list']?.toList() ?? [];
          friendsData?.remove(userId);
          transaction.update(userRef, {'friend_list': friendsData});
        }
      });

      print('friend removed from friends list successfully');
    } catch (e) {
      print('Error removing friend from list challenges: $e');
    }
  }

  Future<void> increaseChallengesCreated(String userId) async {
    try {
      final DocumentReference userDocRef =
      FirebaseFirestore.instance.collection('users').doc(userId);

      // Update the noOfChallengesCreated field by incrementing its value
      await userDocRef.update({
        'noOfChallengesCreated': FieldValue.increment(1),
      });

      print('noOfChallengesCreated incremented successfully');
    } catch (e) {
      print('Error incrementing noOfChallengesCreated: $e');
    }
  }

  Future<List<String>> getUserCreatedChallengesByUserId(String userId) async {
    try {
      var querySnapshot = await challenges.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        List<String> userCreatedChallengeIds = querySnapshot.docs.map((doc) => doc.id).toList();

        print('User Created Challenge IDs: $userCreatedChallengeIds');

        return userCreatedChallengeIds;
      } else {
        print("NO CHALLENGES FOUND CREATED BY GIVEN USER ID");
        return [];
      }
    } catch (e) {
      print("Error getting user created challenges by user ID: $e");
      return [];
    }
  }

}
