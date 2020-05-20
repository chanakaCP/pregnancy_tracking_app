import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/pregnancy.dart';

class TipContainer extends StatefulWidget {
  String callFrom;
  Pregnancy pregnancy;
  String description;
  String imageURL;
  TipContainer(this.callFrom, this.pregnancy, this.description);
  TipContainer.withImage(this.imageURL);

  @override
  _TipContainerState createState() => _TipContainerState();
}

class _TipContainerState extends State<TipContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
              children: <Widget>[
                getCardTitle(this.widget.callFrom),
                SizedBox(width: 20.0),
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
                          text: (this.widget.callFrom == "fromBaby") ? "Week " : "Month ",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
                            color: Colors.green[900],
                          ),
                        ),
                        TextSpan(
                          text: (this.widget.callFrom == "fromBaby")
                              ? this.widget.pregnancy.weeks.toString()
                              : this.widget.pregnancy.months.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0,
                            color: Colors.green[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              this.widget.description,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }

  getCardTitle(String callFrom) {
    String title;
    switch (callFrom) {
      case 'fromBaby':
        title = "Baby`s Development ";
        break;
      case 'fromMom':
        title = "Mother`s Development ";
        break;
      default:
    }
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 18.0,
        color: Colors.red[900],
      ),
    );
  }
}
