import 'package:flutter/material.dart';
import 'package:onboard/widgets/form_field.dart';

class AddIncome extends StatefulWidget {
  @override
  _AddIncomeState createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  TextEditingController _bill = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _rate = TextEditingController();
  TextEditingController _total = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormInput(
      bill: _bill,
      date: _date,
      title: _title,
      rate: _rate,
      total: _total,
      func: ('Add Income'),
    );
  }
}
