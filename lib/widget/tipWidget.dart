import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class TipWidget extends StatelessWidget {
  String text1 =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
  String text2 =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        Divider(
          color: Colors.black45,
          indent: 15.0,
          endIndent: 15.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          child: ExpandableTheme(
            data: ExpandableThemeData(
              useInkWell: true,
              animationDuration: const Duration(milliseconds: 500),
              hasIcon: false,
              tapBodyToCollapse: true,
              tapHeaderToExpand: true,
              crossFadePoint: 0.5,
              tapBodyToExpand: true,
            ),
            child: ExpandablePanel(
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Week 5",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    height: 150.0,
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
                ],
              ),
              collapsed: Column(
                children: <Widget>[
                  Text(
                    text1,
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
              expanded: Text(
                text1,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                softWrap: true,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Divider(
          color: Colors.black45,
          indent: 15.0,
          endIndent: 15.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
          child: ExpandableTheme(
            data: ExpandableThemeData(
              useInkWell: true,
              animationDuration: const Duration(milliseconds: 500),
              hasIcon: false,
              tapBodyToCollapse: true,
              tapHeaderToExpand: true,
              crossFadePoint: 0.5,
              tapBodyToExpand: true,
            ),
            child: ExpandablePanel(
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Daily Tips 15",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    height: 150.0,
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
                ],
              ),
              collapsed: Column(
                children: <Widget>[
                  Text(
                    text2,
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
              expanded: Text(
                text2,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                softWrap: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
