import 'package:firebase_auth/firebase_auth.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/services/http_util.dart';

class SignUpRepo {
  /// Login with firebase
  static Future<UserCredential> firebaseSignUp(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential;
  }

 
}
