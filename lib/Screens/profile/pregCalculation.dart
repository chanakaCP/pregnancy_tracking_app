import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/profile/update/updatePregCalculation.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class PregnancyCalculation extends StatefulWidget {
  User currentUser = User();
  PregnancyCalculation(this.currentUser);
  @override
  _PregnancyCalculationState createState() => _PregnancyCalculationState();
}

class _PregnancyCalculationState extends State<PregnancyCalculation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
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
                  "Pregnancy Calculation",
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
                          return UpdatePregCalculation(this.widget.currentUser);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              height: 70.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Weight",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            this.widget.currentUser.weight.toString(),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "  Kg",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: VerticalDivider(
                      color: Colors.green[700],
                      width: 2.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Blood Count",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            this.widget.currentUser.bloodCount.toString(),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
