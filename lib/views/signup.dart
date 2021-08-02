import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:onboard/auth_service/firebase_auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _email = TextEditingController();
  final _controller = Get.put(AuthService());
  final _password = TextEditingController();
  bool _obsecure = true;
  Icon _icon = Icon(FontAwesomeIcons.eye);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(16),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: _email,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                obscureText: _obsecure,
                controller: _password,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecure = !_obsecure;
                          _obsecure == true
                              ? _icon = Icon(FontAwesomeIcons.eye)
                              : _icon = Icon(FontAwesomeIcons.eyeSlash);
                        });
                      },
                      icon: _icon),
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                onPressed: () {
                  _controller.createUser(
                      _email.text.trim(), _email.text.trim());
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
