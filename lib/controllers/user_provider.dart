import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userName = 'Guest';
  int _ecoPoints = 120;
  String _accountType = 'Individual User'; // Default account type

  String get userName => _userName;
  int get ecoPoints => _ecoPoints;
  String get accountType => _accountType;

  void setUser(String name, int points, String accountType) {
    _userName = name;
    _ecoPoints = points;
    _accountType = accountType;
    notifyListeners();
  }

  void logout() {
    _userName = 'Guest';
    _ecoPoints = 0;
    _accountType = 'Individual User';
    notifyListeners();
  }

  void addPoints(int points) {
    _ecoPoints += points;
    notifyListeners();
  }
}