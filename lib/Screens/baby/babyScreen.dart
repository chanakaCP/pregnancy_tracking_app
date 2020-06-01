import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/babyModel.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/models/pregnancy.dart';
import 'package:pregnancy_tracking_app/services/userDatabaseService.dart';
import 'package:pregnancy_tracking_app/widget/tipContainer.dart';

class BabyScreen extends StatefulWidget {
  User currentUser = User();
  BabyScreen(this.currentUser);

  @override
  _BabyScreenState createState() => _BabyScreenState();
}

class _BabyScreenState extends State<BabyScreen> {
  String text1 =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.";
  Pregnancy pregnancy = Pregnancy();
  UserDatabaseService _userDatabaseService = UserDatabaseService();
  int _selectedIndex;
  Stream babyWeekStram;
  Baby babyWeek = Baby();

  @override
  void initState() {
    super.initState();
    pregnancy.updateValue(this.widget.currentUser);
    _selectedIndex = pregnancy.weeks;
    babyWeekStram = _userDatabaseService.getBabyWeek(_selectedIndex);
  }

  _onDaySelected(int index) {
    setState(() {
      _selectedIndex = index;
      babyWeekStram = _userDatabaseService.getBabyWeek(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: babyWeekStram,
      builder: (context, currentBabySnap) {
        if (currentBabySnap.hasData && currentBabySnap.data.exists) {
          this.babyWeek.size = currentBabySnap.data["size"];
          this.babyWeek.weight = currentBabySnap.data["weight"];
          this.babyWeek.imageURL = currentBabySnap.data["imageURL"];
          this.babyWeek.tipDescription = currentBabySnap.data["tipDescription"];
          this.babyWeek.week = currentBabySnap.data["week"];
        }
        return SingleChildScrollView(
          child: Container(
            color: Colors.lightGreen[00],
            width: double.infinity,
            child: Column(
              children: <Widget>[
                buildWeekRow(),
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
                      image: AssetImage("images/week15.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                SizedBox(height: 5.0),
                buildCountRow(currentBabySnap),
                SizedBox(height: 15.0),
                TipContainer("fromBaby", pregnancy, currentBabySnap),
                SizedBox(height: 10.0)
              ],
            ),
          ),
        );
      },
    );
  }

  buildWeekRow() {
    return Container(
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 41,
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
                                    Text("Week",
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
        },
      ),
    );
  }

  buildCountRow(AsyncSnapshot<dynamic> currentBabySnap) {
    return Container(
      padding: EdgeInsets.only(left: 35.0, right: 35.0),
      height: 100.0,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[100].withOpacity(0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Size",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  currentBabySnap.data["size"].toString(),
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "cm",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
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
                  "Weight",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  currentBabySnap.data["weight"].toString(),
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "g",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
