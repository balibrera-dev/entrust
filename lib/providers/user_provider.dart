import 'package:entrust/models/users.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  //CONSTRUCTOR
  User _user = User(
    id: '',
    username: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );
  //PROPERTIES
  User get user => _user;

  //METHODS
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
