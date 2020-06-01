import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/pregnancy.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class MotherScreen extends StatefulWidget {
  User currentUser = User();
  MotherScreen(this.currentUser);

  @override
  _MotherScreenState createState() => _MotherScreenState();
}

class _MotherScreenState extends State<MotherScreen> {
  String text1 =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.";
  Pregnancy pregnancy = Pregnancy();
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    pregnancy.updateValue(this.widget.currentUser);
    _selectedIndex = pregnancy.months;
  }

  _onDaySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          buildMonthRow(),
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
                image: AssetImage("images/month-2.jpeg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          SizedBox(height: 10.0),
          // TipContainer("fromMom", pregnancy, text1),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  buildMonthRow() {
    return Container(
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 11,
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
                                    Text(
                                      "Month",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 8.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
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
}
