import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<void> saveUserId(String userId, String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    print('USER ID: ' + userId);
    prefs.setString('userName', userName);
    print('userName: ' + userName);
  }

  // Retrieve the user ID from SharedPreferences
  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  static Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedUserName = prefs.getString('userName');

    if (storedUserName != null) {
      print('USER Name: $storedUserName');
      return storedUserName;
    } else {
      print('No username stored.');
      return 'null';
    }
  }

  static Future<bool> isUserExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedUserName = prefs.getString('userName');
    if (storedUserName != null) {
      return true;
    } else {
      return false;
    }
  }

  // Remove the user ID from SharedPreferences (logout)
  static Future<void> removeUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('userName');
    print("REMOVED");
  }
}
