import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/models/user.dart';
import '../../../services/http_util.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSignIn(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  static Future<UserLoginResponseEntity> login(
      {LoginRequestEntity? param}) async {
    print('give info ${jsonEncode(param)}');
    var response =
        await HttpUtil().post('api/login', queryParameters: param?.toJson());
    return UserLoginResponseEntity.fromMap(response);
  }
}
