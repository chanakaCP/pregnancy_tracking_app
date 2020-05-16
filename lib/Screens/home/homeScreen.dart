import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:pregnancy_tracking_app/Screens/motherScreen/motherScreen.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/services/databaseService.dart';
import 'package:pregnancy_tracking_app/Screens/todayScreen/todayScreen.dart';
import 'package:pregnancy_tracking_app/Screens/babyScreen/babyScreen.dart';
import 'package:pregnancy_tracking_app/Screens/tipsScreen/tipsScreen.dart';
import 'package:pregnancy_tracking_app/Screens/more.dart';
import 'package:pregnancy_tracking_app/shared/greetings.dart';

class HomeScreen extends StatefulWidget {
  String userId;
  HomeScreen(this.userId);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseService _databaseService = DatabaseService();
  int _currentIndex;
  Stream userStream;
  User currentUser = User();
  Greetings greeting = Greetings();

  List<Widget> _currentBody() => [
        TodayScreen(currentUser),
        BabyScreen(currentUser),
        MotherScreen(currentUser),
        TipsScreen(currentUser),
        More(currentUser)
      ];

  @override
  void initState() {
    super.initState();
    userStream = _databaseService.getUser(this.widget.userId);
    _currentIndex = 0;
    greeting.welcomeGreetings();
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> currentBody = _currentBody();
    return StreamBuilder(
      stream: userStream,
      builder: (context, currentUserSnap) {
        if (currentUserSnap.hasData && currentUserSnap.data.exists) {
          this.currentUser.name = currentUserSnap.data["name"];
          this.currentUser.age = currentUserSnap.data["age"];
          this.currentUser.userId = currentUserSnap.data["userId"];
          this.currentUser.mobileNumber = currentUserSnap.data["phoneNumber"];
          this.currentUser.lastPeriodDate = currentUserSnap.data["lastPeriodDate"].toDate();
          this.currentUser.dueDate = currentUserSnap.data['dueDate'].toDate();

          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          getTitle(_currentIndex),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(100)),
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
                      Icons.view_agenda,
                      color: Colors.green[100],
                    ),
                    activeIcon: Icon(
                      Icons.view_agenda,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Tips",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.green[100],
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.green[100],
                    ),
                    activeIcon: Icon(
                      Icons.more_horiz,
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
        } else {
          return Container();
        }
      },
    );
  }

  Column getTitle(currentIndex) {
    String title1;
    String title2;
    switch (currentIndex) {
      case 0:
        title1 = greeting.welcomeGreetings();
        title2 = this.currentUser.name.split(" ")[0];
        break;
      case 1:
        title1 = 'Baby`s';
        title2 = 'Development';
        break;
      case 2:
        title1 = 'Mother`s';
        title2 = 'Development';
        break;
      case 3:
        title1 = 'Tips';
        title2 = 'Get more knowledge';
        break;
      case 4:
        title1 = 'More';
        title2 = '';
        break;
      default:
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title1,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w200,
            color: Colors.teal[900],
          ),
        ),
        Text(
          title2,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.teal[900],
          ),
        ),
      ],
    );
  }
}
