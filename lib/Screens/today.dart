import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pregnancy_tracking_app/models/pregnancy.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/shared/shared.dart';
import 'package:intl/intl.dart';

class Today extends StatefulWidget {
  User currentUser = User();
  Today(this.currentUser);
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  Shared shared = Shared();
  Pregnancy pregnancy = Pregnancy();
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    pregnancy.updateValue(this.widget.currentUser);
    _selectedIndex = pregnancy.days;
  }

  _onDaySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[00],
      width: double.infinity,
      child: Column(
        children: <Widget>[
          buildDateRow(),
          SizedBox(height: 5.0),
          buildPercentageBar(),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            height: 250.0,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage("images/women.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          SizedBox(height: 5.0),
          buildCountRow(),
          buildDueRow(),
        ],
      ),
    );
  }

  buildDateRow() {
    return Container(
      height: 40.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 281,
          shrinkWrap: true,
          addAutomaticKeepAlives: false,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: (index != 0)
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      width: (_selectedIndex == index) ? 45.0 : 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: (_selectedIndex == index)
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        index.toString(),
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text("Day",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 8.0,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            : Text(
                                index.toString(),
                                style: TextStyle(
                                  color: Colors.green[800],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                      ),
                    )
                  : Text(''),
              onTap: () => _onDaySelected(index),
            );
          }),
    );
  }

  buildPercentageBar() {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: LinearPercentIndicator(
        animation: true,
        lineHeight: 30.0,
        animationDuration: 2500,
        percent: pregnancy.days / 280,
        center: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'You are ',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              TextSpan(
                text: (pregnancy.days >= 7) ? (pregnancy.days / 7).round().toString() : '',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
              ),
              TextSpan(
                text: (pregnancy.days >= 7)
                    ? (pregnancy.days >= 7 && pregnancy.days <= 13) ? ' week ' : ' weeks '
                    : '',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0),
              ),
              TextSpan(
                text: ((pregnancy.days % 7 != 0) && (pregnancy.days >= 7)) ? '& ' : ' ',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              TextSpan(
                text: (pregnancy.days % 7 != 0) ? (pregnancy.days % 7).toString() : '',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
              ),
              TextSpan(
                text:
                    (pregnancy.days % 7 != 0) ? (pregnancy.days % 7 == 1) ? ' day ' : ' days ' : '',
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
      ),
    );
  }

  buildCountRow() {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      height: 90.0,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[100].withOpacity(0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Day",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  pregnancy.days.toString(),
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w300,
                  ),
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
                  "Week",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  pregnancy.weeks.toString(),
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w300,
                  ),
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
                  "Month",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  pregnancy.months.toString(),
                  style:
                      TextStyle(color: Colors.black45, fontSize: 35.0, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildDueRow() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      height: 70.0,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[100],
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Due date ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: (pregnancy.dueDays <= 0) ? 'was ' : '',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                          color: Colors.black54,
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
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: (pregnancy.dueDays > 0)
                      ? TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: (pregnancy.dueDays >= 7)
                                  ? (pregnancy.dueDays / 7).toInt().toString()
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: Colors.green[700]),
                            ),
                            TextSpan(
                              text: (pregnancy.dueDays >= 7)
                                  ? (pregnancy.dueDays >= 7 && pregnancy.dueDays <= 13)
                                      ? ' week '
                                      : ' weeks '
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0,
                                  color: Colors.green[700]),
                            ),
                            TextSpan(
                              text: ((pregnancy.dueDays % 7 != 0) && (pregnancy.dueDays >= 7))
                                  ? '& '
                                  : '',
                              style:
                                  TextStyle(fontWeight: FontWeight.w300, color: Colors.green[700]),
                            ),
                            TextSpan(
                              text: (pregnancy.dueDays % 7 != 0)
                                  ? (pregnancy.dueDays % 7).toString()
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: Colors.green[700]),
                            ),
                            TextSpan(
                              text: (pregnancy.dueDays % 7 != 0)
                                  ? (pregnancy.dueDays % 7 == 1) ? ' day ' : ' days '
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0,
                                  color: Colors.green[700]),
                            ),
                            TextSpan(
                              text: 'left ',
                              style:
                                  TextStyle(fontWeight: FontWeight.w300, color: Colors.green[700]),
                            ),
                          ],
                        )
                      : TextSpan(
                          text: 'You will delivery soon',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17.0,
                            color: Colors.green[700],
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
