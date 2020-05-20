import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/profile/update/updatePregInfo.dart';
import 'package:pregnancy_tracking_app/models/pregnancy.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:intl/intl.dart';

class PregnancyInfo extends StatefulWidget {
  User currentUser = User();
  PregnancyInfo(this.currentUser);
  @override
  _PregnancyInfoState createState() => _PregnancyInfoState();
}

class _PregnancyInfoState extends State<PregnancyInfo> {
  Pregnancy pregnancy = Pregnancy();

  @override
  void initState() {
    super.initState();
    pregnancy.updateValue(this.widget.currentUser);
  }

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
                  "Pregnancy Information",
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
                          return UpdatePregInfo(this.widget.currentUser);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Due date ',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0,
                      color: Colors.black45,
                    ),
                  ),
                  TextSpan(
                    text: (pregnancy.dueDays <= 0) ? 'was ' : '',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0,
                      color: Colors.black45,
                    ),
                  ),
                  TextSpan(
                    text: ' ' +
                        DateFormat('EEE, d MMM yyyy')
                            .format(this.widget.currentUser.dueDate)
                            .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Text(
                  "Left   ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                    color: Colors.black45,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: pregnancy.dueDays.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.green[900],
                          ),
                        ),
                        TextSpan(
                          text: (pregnancy.dueDays == 1) ? "Day" : " Days",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.green[900],
                          ),
                        ),
                        TextSpan(
                          text: (pregnancy.dueWeeks != 0 && pregnancy.dueDays != 0) ? " | " : "",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.green[900],
                          ),
                        ),
                        TextSpan(
                          text: pregnancy.dueWeeks.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.green[900],
                          ),
                        ),
                        TextSpan(
                          text: (pregnancy.dueWeeks == 1) ? "Week" : " Weeks",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.green[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
