import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/tips/subTopic.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class TopicScreen extends StatefulWidget {
  User currentUser = new User();
  String title;
  TopicScreen(this.currentUser, this.title);

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  String desc =
      "Even if you’ve read lots about pregnancy and spoken to other mums about your pregnancy symptoms, there will still be times when you wonder if what you’re feeling is normal or not.The following pregnancy symptoms should set off a few alarm bells. If you experience them you should call your midwife, doctor, or your maternity unit straight away.Add the number of your maternity unit to your phone contacts so you can speak to a midwife without delay if you need to.";

  @override
  Widget build(BuildContext context) {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                              Icons.arrow_back,
                              color: Colors.black26,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
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
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.green[900],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
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
                          image: AssetImage("images/profile.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      desc,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SubTopic(this.widget.currentUser),
            ],
          ),
        ),
      ),
    );
  }
}
