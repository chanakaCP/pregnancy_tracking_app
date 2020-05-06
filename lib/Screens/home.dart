import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/databaseService.dart';

class Home extends StatefulWidget {
  String userId;
  Future<User> currentUser;
  Home(this.userId);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: this._databaseService.getUser(this.widget.userId),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: Column(
              children: <Widget>[
                Text(snapshot.data['age'].toString()),
                Text(snapshot.data['name'].toString()),
                Text(snapshot.data['password'].toString()),
              ],
            ),
          );
        });
  }
}
