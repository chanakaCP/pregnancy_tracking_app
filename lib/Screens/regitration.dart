import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/services/authService.dart';
import '../models/user.dart';
import 'slider.dart';

class Registration extends StatefulWidget {
  String userId;
  User loginUser;
  Registration(this.userId, this.loginUser);
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String userName = "";
  int age;
  DateTime pickedDate;
  bool _isDateSelect = false;
  String _errorText = '';

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
                  right: 0.0,
                  child: Image.asset(
                    'images/top2.png',
                    color: Color.fromRGBO(174, 213, 129, 0.6),
                  ),
                ),
                Positioned(
                  height: 100.0,
                  bottom: 0.0,
                  left: 0.0,
                  child: Image.asset(
                    'images/bottom2.png',
                    color: Color.fromRGBO(197, 225, 165, 0.6),
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: 50.0,
                  child: Center(
                    child: Text(
                      "Register",
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
                      child: Image.asset("images/registration.jpg"),
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
                              prefixIcon: Icon(Icons.keyboard),
                              hintText: "Your name",
                              filled: true,
                              fillColor: Colors.green[50],
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                userName = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
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
                              prefixIcon: Icon(Icons.keyboard),
                              hintText: "Age",
                              filled: true,
                              fillColor: Colors.green[50],
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                age = int.parse(value);
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _pickDate(context);
                            });
                          },
                          child: Container(
                            height: 55.0,
                            width: double.infinity,
                            child: SizedBox(
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 0,
                                color: Colors.green[50],
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        () {
                                          if (!_isDateSelect) {
                                            return 'Last period start date';
                                          } else {
                                            return pickedDate.year.toString() +
                                                " - " +
                                                pickedDate.month.toString() +
                                                " - " +
                                                pickedDate.day.toString();
                                          }
                                        }(),
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          _errorText,
                          style:
                              TextStyle(fontSize: 11.5, color: Colors.red[700]),
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
                                "SignUp",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                if (!_isDateSelect) {
                                  setState(() {
                                    _errorText =
                                        'Please enter last period date';
                                  });
                                } else {
                                  this.widget.loginUser.name = this.userName;
                                  this.widget.loginUser.age = this.age;
                                  this.widget.loginUser.lastPeriodDate =
                                      this.pickedDate;
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SliderPage(this.widget.loginUser),
                                    ),
                                  );
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

  Future<Null> _pickDate(BuildContext context) async {
    DateTime _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    );
    if (_date != null) {
      setState(() {
        _isDateSelect = true;
        _errorText = '';
        pickedDate = _date;
      });
    }
  }
}
