import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/profile/editDetails/editPersonalInfo.dart';
import 'package:pregnancy_tracking_app/Screens/profile/paymentInfo.dart';
import 'package:pregnancy_tracking_app/Screens/profile/pregCalculation.dart';
import 'package:pregnancy_tracking_app/Screens/profile/pregInfo.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/services/authService.dart';

class ProfileScreen extends StatefulWidget {
  User currentUser = User();
  ProfileScreen(this.currentUser);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          buildPersonalInfo(),
          PregnancyInfo(this.widget.currentUser),
          PregnancyCalculation(),
          PaymentInfo(),
          buildLogoutButton(),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  buildPersonalInfo() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.lightGreen[100].withOpacity(0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Personal Information",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                    color: Colors.red[900],
                  ),
                ),
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
                      Icons.edit,
                      size: 20.0,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditPersonalInfo(this.widget.currentUser);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 130.0,
                  width: 130.0,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.widget.currentUser.name,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black87),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      this.widget.currentUser.mobileNumber,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black87),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      this.widget.currentUser.age.toString() + " Years old",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildLogoutButton() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      width: double.infinity,
      child: Container(
        height: 45.0,
        width: double.infinity,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          color: Colors.lightGreen[100].withOpacity(0.7),
          textColor: Colors.lightGreen[900],
          splashColor: Colors.green[200],
          child: Text(
            "Logout",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () {
            var authService = AuthService();
            authService.signOut(this.context);
          },
        ),
      ),
    );
  }
}
