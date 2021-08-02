import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboard/controller/onboard_controller.dart';
import 'package:onboard/views/login_screen.dart';
import 'package:onboard/views/onbardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late bool? initscreen;
final controller = OnboardController();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  initscreen = (await preferences.getBool('initscreen'));
  await preferences.setBool('initscreen', true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: initscreen == true ? LoginPage() : OnBoard(),
    );
  }
}
