import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/services/authService.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AuthService _authService = AuthService();
  bool isSignIn = true;
  @override
  void initState() {
    super.initState();
    _authService.checkSignIn().then((user) {
      setState(() {
        if (user == null) {
          isSignIn = false;
        } else {
          isSignIn = true;
          _authService.signIn(context, user);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                height: 130.0,
                top: 0.0,
                left: 0.0,
                child: Image.asset(
                  'images/pageDeco/top1.png',
                  color: Color.fromRGBO(174, 213, 129, 0.6),
                ),
              ),
              Positioned(
                height: 90.0,
                bottom: 0.0,
                left: 0.0,
                child: Image.asset(
                  'images/pageDeco/bottom1.png',
                  color: Color.fromRGBO(197, 225, 165, 0.6),
                ),
              ),
              Positioned(
                top: 300.0,
                right: -80.0,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Color.fromRGBO(220, 237, 200, 1),
                ),
              ),
              Positioned(
                top: 50.0,
                right: 50.0,
                child: Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 130.0,
                child: Center(
                  child: Container(
                    height: 230.0,
                    child: Image.asset("images/logo/logoIconDef.png"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 300.0, left: 55.0, right: 55.0),
                child: Container(
                  child: isSignIn ? buildTagLine() : buildSignUpButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSignUpButton() {
    return Container(
      height: 45.0,
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: Colors.green[50]),
        ),
        color: Colors.green[50],
        textColor: Colors.black87,
        splashColor: Colors.green[200],
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/signUp');
        },
      ),
    );
  }

  buildTagLine() {
    return Container(
      height: 60.0,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            "Kuwa mama bora,",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300),
          ),
          Text(
            "Toka siku ya kwanza.",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
