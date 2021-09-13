import 'package:flutter/material.dart';
import 'package:catalog/locator.dart';
import 'package:catalog/datamodels/user.dart';
import 'package:catalog/services/data_manager/data_manager.dart';

final String loginSuccessful = "logged in successfully";
final String loginUnsuccessful = "login unsuccessful";

class LoginViewModel extends ChangeNotifier {
  final db = locator<DataManager>();

  User? loggedInUser;

  bool isLoggedIn() {
    return loggedInUser != null;
  }

  String loginMessage() {
    return isLoggedIn() ? loginSuccessful : loginUnsuccessful;
  }

  dynamic login({required String username, required String password}) async {
    loggedInUser = db.users.retrieve(username: username, password: password);
    notifyListeners();
  }
}
