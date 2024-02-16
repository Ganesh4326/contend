import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/core/logger/log.dart';

class ChallengeDurationManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> backgroundFetch() async {
    print('Background fetch started!');
    logger.d('message');

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _db.collection('users').get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        if (document.exists) {
          List<dynamic> acceptedChallenges =
              document['acceptedChallenges'] ?? [];

          for (Map<String, dynamic> challenge in acceptedChallenges) {
            int noOfDaysLeft = challenge['noOfDaysLeft'] ?? 0;

            if (noOfDaysLeft > 0) {
              noOfDaysLeft--;
              print("no of days left: " + noOfDaysLeft.toString());
            }

            challenge['noOfDaysLeft'] = noOfDaysLeft;
          }

          await _db
              .collection('users')
              .doc(document.id)
              .update({'acceptedChallenges': acceptedChallenges});
        }
      }

      print('Background fetch completed!');
    } catch (e) {
      print('Error during background fetch: $e');
    }
  }

  Future<void> scheduleBackgroundTask() async {
    print("INSIDE THE SCHEDULE BACKGROUND");
    await AndroidAlarmManager.periodic(
      const Duration(minutes: 1),
      0,
      backgroundFetch,
      wakeup: true,
    );
    print('Background task scheduled!');
  }
}
