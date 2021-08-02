import 'package:flutter/material.dart';

import 'addIncome.dart';
import 'addExpenses.dart';

class AddingScreen extends StatelessWidget {
  const AddingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.teal,
            bottom: TabBar(
              indicatorColor: Colors.greenAccent,
              indicatorWeight: 4.0,
              tabs: [
                Tab(
                  child: Container(
                    child: Text(
                      'Income',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Expenses',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AddIncome(),
            AddExpenses(),
          ],
        ),
      ),
    );
  }
}
