import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class UpdatePregCalculation extends StatefulWidget {
  User currentUser = User();
  UpdatePregCalculation(this.currentUser);
  @override
  _UpdatePregCalculationState createState() => _UpdatePregCalculationState();
}

class _UpdatePregCalculationState extends State<UpdatePregCalculation> {
  final _formKey = GlobalKey<FormState>();
  double bloodCount;
  double weight;

  @override
  Widget build(BuildContext context) {
    bloodCount = 9.5;
    weight = 55.8;
    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.lightGreen[50],
      content: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Pregnancy Calculation",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  color: Colors.red[900],
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: this.weight.toString(),
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
                    hintText: "Wegiht",
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    this.weight = double.parse(value);
                  },
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: this.bloodCount.toString(),
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
                    prefixIcon: Icon(Icons.pregnant_woman),
                    hintText: "Blood Count",
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (double.parse(value) < 8.0 || double.parse(value) > 15.0) {
                      return "Invalid Blood count";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    this.bloodCount = double.parse(value);
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
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          //  SUBMIT FORM
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
