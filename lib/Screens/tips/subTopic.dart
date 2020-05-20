import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class SubTopic extends StatefulWidget {
  User currentUser = new User();
  SubTopic(this.currentUser);
  @override
  _SubTopicState createState() => _SubTopicState();
}

class _SubTopicState extends State<SubTopic> {
  String title1 = "I have a pain in my middle";
  String title2 = "I have a pain in my lower belly";
  String title3 = "I have a fever";
  String title4 = "My hands and feet are swollen";
  String title5 = "I have a headache that won’t go away";

  String desc1 =
      "Severe or sharp pain in your middle or upper tummy, with or without nausea or vomiting, could mean one of several things. If you’re in the second half of your pregnancy, pain in your middle, usually just under your ribs, could indicate severe pre-eclampsia. This is a serious condition for which you'll need immediate medical help.";
  String desc2 =
      "Severe pain on either side or both sides of your lower belly needs investigating, to be sure it’s nothing serious. You could have pulled or stretched a ligament, which is common in pregnancy.Conditions that may cause stomach pain, and need to be checked urgently,";
  String desc3 =
      "If you have a fever and your temperature is above 37.5 degrees C, but with no cold symptoms, call your doctor the same day.If your temperature is more than 39 degrees C, call your local maternity unit straight away. You probably have an infection which may need treating urgently with antibiotics. If your temperature rises higher than 39 degrees C for a long time it may be harmful to your baby.";
  String desc4 =
      "Swelling or puffiness (oedema) in your hands, face and eyes is common in late pregnancy. In most cases, it’s not a cause for concern. But if your swelling comes on suddenly, or has become more severe, and you have a headache or problems with your vision, you may have pre-eclampsia. If you notice any of these symptoms, call your doctor or midwife straight away.";
  String desc5 =
      "If your headache doesn’t stop or is recurring, and you have visual disturbances and sudden swelling in your body, you may have pre-eclampsia. If pre-eclampsia occurs, it is usually in the second half of your pregnancy or soon after your baby is born.";

  @override
  Widget build(BuildContext context) {
    List<String> testTitle = List();
    List<String> testDesc = List();
    testTitle.add(title1);
    testTitle.add(title2);
    testTitle.add(title3);
    testTitle.add(title4);
    testTitle.add(title5);
    testDesc.add(desc1);
    testDesc.add(desc2);
    testDesc.add(desc3);
    testDesc.add(desc4);
    testDesc.add(desc5);
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        for (int i = 0; i < 5; i++) buildTipCard(testTitle[i], testDesc[i]),
      ],
    );
  }
}

buildTipCard(String title, String description) {
  return Column(
    children: <Widget>[
      Divider(
        color: Colors.green[500],
        indent: 15.0,
        endIndent: 15.0,
      ),
      Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 19.0,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
              softWrap: true,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    ],
  );
}
