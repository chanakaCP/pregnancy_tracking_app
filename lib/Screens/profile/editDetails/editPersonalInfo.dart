import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/signUP/mobileVerf.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class EditPersonalInfo extends StatefulWidget {
  User currentUser = User();
  EditPersonalInfo(this.currentUser);
  @override
  _EditPersonalInfoState createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  String userName;
  int age;
  @override
  Widget build(BuildContext context) {
    userName = this.widget.currentUser.name;
    age = this.widget.currentUser.age;
    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.lightGreen[50],
      content: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Personal Information",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
                color: Colors.red[900],
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green[300].withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpg"),
                  ),
                ),
                SizedBox(width: 15.0),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 20.0,
                          color: Colors.green[800],
                        ),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.delete,
                          size: 20.0,
                          color: Colors.green[800],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Container(
              child: TextFormField(
                initialValue: userName,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Name",
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.2),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name is required';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  this.userName = value;
                },
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: this.age.toString(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Age",
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.2),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  this.age = int.parse(value);
                },
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 30.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Colors.red[400].withOpacity(0.9),
                    textColor: Colors.white,
                    splashColor: Colors.red,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  height: 30.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Colors.green[400],
                    textColor: Colors.white,
                    splashColor: Colors.green[400],
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
