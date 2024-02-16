import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userId;

  UserProvider(this._userId);

  String get userId => _userId;

  // This method could be used to update the user ID
  void setUserId(String newUserId) {
    _userId = newUserId;
    print('USER ID' + newUserId);
    notifyListeners(); // Notify listeners about the change
  }

  String getUserId() {
    return _userId;
  }
}
