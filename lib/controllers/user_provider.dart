import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userName = 'Guest';
  int _ecoPoints = 120;
  String _accountType = 'Individual User';
  double _walletBalance = 5250.0; // In Naira
  String _subscriptionPlan = 'None'; // None, Weekly, Monthly
  DateTime? _subscriptionExpiry;
  bool _isVerified = false; // Verification status
  List<String> _redeemedItems = []; // Track redeemed items

  String get userName => _userName;
  int get ecoPoints => _ecoPoints;
  String get accountType => _accountType;
  double get walletBalance => _walletBalance;
  String get subscriptionPlan => _subscriptionPlan;
  DateTime? get subscriptionExpiry => _subscriptionExpiry;
  bool get isVerified => _isVerified;
  List<String> get redeemedItems => _redeemedItems;
  bool get isSubscribed => _subscriptionPlan != 'None' && (_subscriptionExpiry?.isAfter(DateTime.now()) ?? false);

  void setUser(String name, int points, String accountType, double walletBalance) {
    _userName = name;
    _ecoPoints = points;
    _accountType = accountType;
    _walletBalance = walletBalance;
    notifyListeners();
  }

  void logout() {
    _userName = 'Guest';
    _ecoPoints = 0;
    _accountType = 'Individual User';
    _walletBalance = 0.0;
    _subscriptionPlan = 'None';
    _subscriptionExpiry = null;
    _isVerified = false;
    _redeemedItems = [];
    notifyListeners();
  }

  void addPoints(int points) {
    _ecoPoints += points;
    notifyListeners();
  }

  void fundWallet(double amount) {
    _walletBalance += amount;
    notifyListeners();
  }

  void subscribe(String plan) {
    _subscriptionPlan = plan;
    _subscriptionExpiry = plan == 'Weekly'
        ? DateTime.now().add(const Duration(days: 7))
        : DateTime.now().add(const Duration(days: 30));
    notifyListeners();
  }

  void verifyUser() {
    _isVerified = true;
    notifyListeners();
  }

  bool redeemPoints(String item, int pointsRequired) {
    if (_ecoPoints >= pointsRequired) {
      _ecoPoints -= pointsRequired;
      _redeemedItems.add(item);
      notifyListeners();
      return true;
    }
    return false;
  }
}