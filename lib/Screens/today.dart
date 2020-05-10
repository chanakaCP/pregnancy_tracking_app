import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pregnancy_tracking_app/services/databaseService.dart';

class Today extends StatefulWidget {
  // FirebaseUser user;
  // Today(this.user);
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  // DatabaseService _databaseService = DatabaseService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          buildPercentageBar(),
          SizedBox(height: 15.0),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 250.0,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage("images/week15.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          buildCountRow(),
          buildDueRow(),
        ],
      ),
    );
  }

  buildPercentageBar() {
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 30.0,
      animationDuration: 2500,
      percent: (7 * 16 + 6) / 294,
      center: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'You are ',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            TextSpan(
              text: '15 ',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
            ),
            TextSpan(
              text: 'weeks ',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0),
            ),
            TextSpan(
              text: '& ',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            TextSpan(
              text: '6 ',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
            ),
            TextSpan(
              text: 'days ',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0),
            ),
            TextSpan(
              text: 'pregnant ',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: Colors.red[400],
      backgroundColor: Colors.red[200],
      curve: Curves.easeInOut,
    );
  }

  buildCountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 80.0,
          width: 80.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Day",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "107",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 80.0,
          width: 80.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Week",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "15",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 80.0,
          width: 80.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Month",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "4",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildDueRow() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 60.0,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.lightGreen[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Due Date : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: '15 th Oct 2020 ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '15 ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                      TextSpan(
                        text: 'weeks ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0,
                        ),
                      ),
                      TextSpan(
                        text: '& ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '6 ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                      TextSpan(
                        text: 'days ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0,
                        ),
                      ),
                      TextSpan(
                        text: 'left ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
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
