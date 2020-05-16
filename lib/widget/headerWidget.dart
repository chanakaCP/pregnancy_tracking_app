import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "title1",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.teal[900],
                ),
              ),
              Text(
                "title2",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.teal[900],
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
