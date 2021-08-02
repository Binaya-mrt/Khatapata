import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:onboard/views/screens/addpage.dart';
import 'package:onboard/views/screens/home.dart';
import 'package:onboard/views/screens/transcation.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    AddingScreen(),
    Transcations(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Khata Pata',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  DateFormat.yMMMd().format(DateTime.now()).toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedItemColor: Colors.teal,
        unselectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: FaIcon(FontAwesomeIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Add',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Transcations',
            icon: Icon(FontAwesomeIcons.receipt),
          ),
        ],
      ),
      body: tabs[_currentIndex],
    );
  }
}
