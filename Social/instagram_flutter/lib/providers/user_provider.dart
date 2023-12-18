import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/models.dart';
import 'package:instagram_flutter/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  AuthMethod _authMethod = AuthMethod();
  // getter
  User get getUser => _user!;

  /// Làm mới user
  Future<void> refreshUser() async {
    User user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
