import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/tipsScreen/topicScreen.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class TipsScreen extends StatefulWidget {
  User currentUser = new User();
  TipsScreen(this.currentUser);

  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  List<String> tipsList = new List();
  @override
  void initState() {
    tipsList.add("Pregnancy symptoms you should never ignore");
    tipsList.add("how big is your baby ?");
    tipsList.add("Pregnancy meal planners");
    tipsList.add("Pregnancy scans");
    tipsList.add("Find the right formula milk");
    tipsList.add("When can your baby sleep through ?");
    tipsList.add("Moving from a cot to a bed");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.22,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tipsList.length,
            itemBuilder: (context, position) {
              return buildListItem(tipsList[position]);
            },
          ),
        ),
      ],
    );
  }

  buildListItem(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18.0),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 17.0, bottom: 17.0),
        decoration: BoxDecoration(
          color: Colors.lightGreen[100].withOpacity(0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 250.0,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(right: 1.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.green[200].withOpacity(0.4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black26,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicScreen(this.widget.currentUser, title),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
