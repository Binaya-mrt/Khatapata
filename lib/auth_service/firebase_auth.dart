import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onboard/views/login_screen.dart';
import 'package:onboard/views/screens/homescreen.dart';

class AuthService extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Get.offAll(() => (LoginPage()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
    }
  }

  Future userSignin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Get.offAll(() => (HomeNav()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
    }
  }
}
