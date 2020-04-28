import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _isPassObs = true;
  bool _isReEnterPassObs = true;
  String _firstPass;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  height: 110.0,
                  top: 0.0,
                  left: 0.0,
                  child: Image.asset(
                    'images/top3.png',
                    color: Color.fromRGBO(174, 213, 129, 0.6),
                  ),
                ),
                Positioned(
                  height: 100.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: Image.asset(
                    'images/bottom3.png',
                    color: Color.fromRGBO(197, 225, 165, 0.6),
                  ),
                ),
                Positioned(
                  top: 40.0,
                  right: 50.0,
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100.0,
                  child: Center(
                    child: Container(
                      height: 170.0,
                      child: Image.asset("images/signup.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 300.0, left: 55.0, right: 55.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              prefixIcon: Icon(Icons.person),
                              hintText: "Phone Number",
                              filled: true,
                              fillColor: Colors.green[50],
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Phone Number is required';
                                // } else if () {

                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          child: TextFormField(
                            obscureText: _isPassObs,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              prefixIcon: Icon(Icons.vpn_key),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPassObs = !_isPassObs;
                                  });
                                },
                                child: Icon(
                                  _isPassObs
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              hintText: "Password",
                              filled: true,
                              fillColor: Colors.green[50],
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 char';
                              } else {
                                _firstPass = value;
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          child: TextFormField(
                            obscureText: _isReEnterPassObs,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              prefixIcon: Icon(Icons.vpn_key),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isReEnterPassObs = !_isReEnterPassObs;
                                  });
                                },
                                child: Icon(
                                  _isReEnterPassObs
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              hintText: "Re enter password",
                              filled: true,
                              fillColor: Colors.green[50],
                              border: InputBorder.none,
                            ),
                            validator: (passValue) {
                              if (passValue.isEmpty) {
                                return 'Re enter your password';
                              } else if (_firstPass != passValue) {
                                return 'Password didn`t match';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 35.0),
                        Container(
                          height: 45.0,
                          width: double.infinity,
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(color: Colors.green[400]),
                              ),
                              color: Colors.green[400],
                              textColor: Colors.white,
                              splashColor: Colors.green[200],
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pushNamed(context, '/mobileVerify');
                                }
                              }),
                        ),
                        SizedBox(height: 13.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an ccount ? ",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/signIn');
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
