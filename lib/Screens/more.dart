import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class More extends StatefulWidget {
  User currentUser = new User();
  More(this.currentUser);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("More"),
    );
  }
}
