import 'package:flutter/material.dart';
import '../models/user.dart';

class Home extends StatefulWidget {
  User loginUser;
  Home(this.loginUser);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          Text(this.widget.loginUser.name),
          Text(this.widget.loginUser.age.toString()),
          Text(this.widget.loginUser.mobileNumber),
          Text(this.widget.loginUser.password),
          Text(this.widget.loginUser.lastPeriodDate.toString()),
          Text(this.widget.loginUser.uId),
        ],
      ),
    );
  }
}
