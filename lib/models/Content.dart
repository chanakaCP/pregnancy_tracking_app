import 'package:pregnancy_tracking_app/models/SubContent.dart';

class Content {
  String contentId;
  int priority;
  String title;
  String description;
  String imageURL;
  List<SubContent> subTopics = new List();
}
