import 'package:flutter/material.dart';
import 'package:onboard/model/transcation.dart';
import '../database/db.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    Key? key,
    required TextEditingController bill,
    required TextEditingController date,
    required TextEditingController title,
    required TextEditingController rate,
    required TextEditingController total,
    required String func,
  })  : _bill = bill,
        _date = date,
        _title = title,
        _rate = rate,
        _total = total,
        _func = func;

  final TextEditingController _bill;
  final TextEditingController _date;
  final TextEditingController _title;
  final TextEditingController _rate;
  final TextEditingController _total;
  final String _func;

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
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
                        controller: widget._bill,
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
                        controller: widget._date,
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
                  controller: widget._title,
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
                  controller: widget._rate,
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
                  controller: widget._total,
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
                    await nafadb.instance.add(
                      Transcation(
                          invoice: widget._bill.text,
                          date: widget._date.text,
                          title: widget._title.text,
                          rate: widget._rate.text,
                          total: widget._total.text),
                    );
                    setState(() {
                      widget._bill.clear();
                      widget._date.clear();
                      widget._title.clear();
                      widget._rate.clear();
                      widget._total.clear();
                    });
                  },
                  child: Text(
                    widget._func,
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
