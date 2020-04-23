import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size widgetSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: widgetSize.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: -90.0,
                left: -90.0,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.green[300],
                ),
              ),
              Positioned(
                bottom: -100.0,
                left: -70.0,
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.green[200],
                ),
              ),
              Positioned(
                top: 300.0,
                right: -80.0,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.green[100],
                ),
              ),
              Positioned(
                top: 50.0,
                left: 175,
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
                top: 140.0,
                child: Center(
                  child: Container(
                    height: 180.0,
                    child: Image.asset("images/welcome2.jpeg"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 400.0, left: 55.0, right: 55.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 45.0,
                      width: double.infinity,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.green[400]),
                        ),
                        onPressed: () {},
                        color: Colors.green[400],
                        textColor: Colors.white,
                        splashColor: Colors.green[200],
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 45.0,
                      width: double.infinity,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.green[50]),
                        ),
                        onPressed: () {},
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
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
