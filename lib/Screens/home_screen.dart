import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_demo2/Widgets/small_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Text(
                'Balance',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$20,000',
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 25,
                    ),
                    onPressed: () => print('Pressed eye button'),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Row(
                children: <Widget>[
                  SmallCard(
                    str: 'Income',
                    icon: Icons.arrow_drop_down_circle,
                    value: '\$2200',
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  SmallCard(
                    str: 'Expenses',
                    icon: Icons.check_circle,
                    value: '\$1200',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
