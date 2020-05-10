import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import '../services/databaseService.dart';
import '../services/authService.dart';
import 'baby.dart';
import 'mother.dart';
import 'today.dart';
import 'more.dart';

class Home extends StatefulWidget {
  String userId;
  Home(this.userId);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseService _databaseService = DatabaseService();
  int _currentIndex;
  Stream userStream;
  User currentUser = User();
  List<Widget> currentBody = [Today(), Baby(), Mother(), More()];

  @override
  void initState() {
    super.initState();
    userStream = _databaseService.getUser(this.widget.userId);
    _currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userStream,
      builder: (context, currentUserSnap) {
        this.currentUser.name = currentUserSnap.data["name"];
        this.currentUser.age = currentUserSnap.data["age"];
        this.currentUser.userId = currentUserSnap.data["userId"];
        this.currentUser.mobileNumber = currentUserSnap.data["phoneNumber"];
        this.currentUser.lastPeriodDate =
            currentUserSnap.data["lastPeriodDate"].toDate();

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Good Mornning",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.teal[900],
                              ),
                            ),
                            Text(
                              this.currentUser.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal[900],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/profile.jpg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  currentBody[_currentIndex],
                ],
              ),
            ),
            bottomNavigationBar: BubbleBottomBar(
              opacity: 0.4,
              backgroundColor: Colors.green[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              currentIndex: _currentIndex,
              hasInk: false,
              hasNotch: false,
              elevation: 30,
              iconSize: 25.0,
              inkColor: Colors.black,
              onTap: changePage,
              items: <BubbleBottomBarItem>[
                BubbleBottomBarItem(
                  backgroundColor: Colors.green[100],
                  icon: Icon(
                    Icons.today,
                    color: Colors.green[100],
                  ),
                  activeIcon: Icon(
                    Icons.today,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Today",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Colors.green[100],
                  icon: Icon(
                    Icons.child_care,
                    color: Colors.green[100],
                  ),
                  activeIcon: Icon(
                    Icons.child_care,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Baby",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Colors.green[100],
                  icon: Icon(
                    Icons.pregnant_woman,
                    color: Colors.green[100],
                  ),
                  activeIcon: Icon(
                    Icons.pregnant_woman,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Mother",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Colors.green[100],
                  icon: Icon(
                    Icons.menu,
                    color: Colors.green[100],
                  ),
                  activeIcon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  title: Text(
                    "More",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
