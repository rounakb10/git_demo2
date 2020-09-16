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
        //centerTitle: true,
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
//        child: Icon(
//          Icons.add,
//          size: 30,
//        ),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _currentIndex,
//        unselectedIconTheme: IconThemeData(size: 20),
//        selectedIconTheme: IconThemeData(size: 20, color: Colors.blue),
//        selectedLabelStyle: TextStyle(color: Colors.blue),
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.dashboard),
//            title: Text('Dashboard'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.add_circle),
//            title: Text('Add'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.settings),
//            title: Text('Settings'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.menu),
//            title: Text('Menu'),
//          ),
//        ],
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
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
                    '\$20000',
                    style: TextStyle(fontSize: 30),
                  ),
                  Icon(
                    Icons.remove_red_eye,
                    size: 25,
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
