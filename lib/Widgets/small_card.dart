import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String str;
  final IconData icon;
  final String value;

  SmallCard({this.str, this.icon, this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: <Widget>[
              Text(str),
              SizedBox(
                height: 10,
              ),
              Text(value)
            ],
          ),
        ],
      ),
    );
  }
}
