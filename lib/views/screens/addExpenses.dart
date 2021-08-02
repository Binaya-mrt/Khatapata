import 'package:flutter/material.dart';
import 'package:onboard/model/transcation.dart';
import 'package:onboard/database/db.dart';

class AddExpenses extends StatefulWidget {
  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  TextEditingController _bill = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _rate = TextEditingController();
  TextEditingController _total = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _bill,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            hintText: 'Bill no', border: InputBorder.none),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _date,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            hintText: 'Date', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: _title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      hintText: 'Title', border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: _rate,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      hintText: 'Rate', border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: _total,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      hintText: 'Total', border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await nafadb.instance.create(
                      Transcation(
                          invoice: _bill.text,
                          date: _date.text,
                          title: _title.text,
                          rate: _rate.text,
                          total: _total.text),
                    );
                    setState(() {
                      _bill.clear();
                      _date.clear();
                      _title.clear();
                      _rate.clear();
                      _total.clear();
                    });
                  },
                  child: Text(
                    'Add Expenses',
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ],
          ),
        ),
      ),
    );
  }
}
