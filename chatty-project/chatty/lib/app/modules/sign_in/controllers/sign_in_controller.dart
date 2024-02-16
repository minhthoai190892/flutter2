// // ignore_for_file: avoid_print, unnecessary_overrides

// import 'package:chatty/app/common/entities/user.dart';
// import 'package:chatty/app/modules/sign_in/index/index.dart';
// import 'package:chatty/app/routes/app_pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class SignInController extends GetxController {
//   //TODO: Implement SignInController
//   SignInController();
//   final state = SignInState();
//   final count = 0.obs;
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openId']);
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;

//   /// @param type loại đăng nhập
//   /// 1. google
//   /// 2. facebook
//   /// 3. apple
//   /// 4. phone number
//   /// 5. email
//   void handleSignIn({required String type}) async {
//     try {
//       if (type == 'phone number') {
//         print('.... you are logging in with phone number....');
//       } else if (type == 'Google') {
//         print('.... you are logging in with google....');
//         var user = await _googleSignIn.signIn();
//         if (user != null) {
//           final _gAuthentication = await user.authentication;
//           final _credential = GoogleAuthProvider.credential(
//             idToken: _gAuthentication.idToken,
//             accessToken: _gAuthentication.accessToken,
//           );
//           await FirebaseAuth.instance.signInWithCredential(_credential);
//           String? displayName = user.displayName;
//           String email = user.email;
//           String id = user.id;
//           String photoUrl = user.photoUrl ?? 'assets/icons/google.png';
//           // / entity user
//           LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
//           loginPanelListRequestEntity.avatar = photoUrl;
//           loginPanelListRequestEntity.name = displayName;
//           loginPanelListRequestEntity.email = email;
//           loginPanelListRequestEntity.open_id = id;
//           loginPanelListRequestEntity.online = 2;
//           print('photoUrl ${photoUrl}');
//           asyncPostAllData();
//         }
//       } else if (type == 'Facebook') {
//         print('.... you are logging in with facebook....');
//       } else if (type == 'Apple') {
//         print('.... you are logging in with apple....');
//       } else {}
//     } catch (e) {
//       print('.... error: $e');
//     }
//   }

//   asyncPostAllData() {
//     Get.offAllNamed(Routes.MESSAGE);
//   }
// }

import 'package:chatty/app/common/store/store.dart';
import 'package:chatty/app/common/utils/http.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/entities/entities.dart';
import '../../../routes/app_pages.dart';
import '../index/index.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  void handleSignIn(String type) async {
    //1:email 2:google 3:facebook 4:apple 5:phone
    try {
      if (type == 'phone number') {
        if (kDebugMode) {
          print('...you are loggin in with phone number...');
        }
      } else if (type == 'Google') {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          final _gAuthentication = await user.authentication;
          final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken,
          );
          await FirebaseAuth.instance.signInWithCredential(_credential);
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
          asyncPostAllData();
        }
      } else {
        if (kDebugMode) {
          print('...login type not sure...');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('...error with login $e');
      }
    }
  }

  asyncPostAllData() async {
    // print('---> MESSAGE page');
    // var response = await HttpUtil().get('/api/index');
    // print(response);
    UserStore.to.setIsLogin = true;
    Get.offAllNamed(Routes.MESSAGE);
  }
}
