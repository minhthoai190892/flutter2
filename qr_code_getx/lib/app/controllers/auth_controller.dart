import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String? uid; //kiểm tra xem có người dùng nào không
  late FirebaseAuth auth;
  //TODO: Implement AuthController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((event) {
      uid = event?.uid;
    });
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return {'error': false, 'message': 'login successful'};
    } on FirebaseAuthException catch (e) {
      return {'error': true, 'message': e.message};
    } catch (e) {
      return {'error': true, 'message': 'login failed'};
    }
  }

  Future<Map<String, dynamic>> logout() async {
    try {
      await auth.signOut();
      return {'error': false, 'message': 'logout successful'};
    } on FirebaseAuthException catch (e) {
      return {'error': true, 'message': e.message};
    } catch (e) {
      return {'error': true, 'message': 'logout failed'};
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
