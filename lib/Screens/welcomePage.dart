import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
                padding: EdgeInsets.only(top: 400.0, left: 55.0, right: 55.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 45.0,
                      width: double.infinity,
                      child: Opacity(
                        opacity: 0.7,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: Colors.green[400]),
                          ),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/signIn');
                          },
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
                    ),
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
