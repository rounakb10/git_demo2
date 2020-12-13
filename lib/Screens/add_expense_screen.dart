import 'package:flutter/material.dart';

import '../constants.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Expense',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    //use value
                  },
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  color: Colors.grey,
                  height: 40,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
