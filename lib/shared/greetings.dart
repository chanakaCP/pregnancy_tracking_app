import 'package:intl/intl.dart';

class Greetings {
  String welcomeGreetings() {
    DateTime mTime = DateTime(00, 00);
    DateTime lTime = DateTime(12, 00);
    DateTime eTime = DateTime(18, 00);
    DateTime current = DateTime.now();
    String greeting;
    if (current.isAfter(eTime)) {
      greeting = "Good Evening";
    } else if (current.isBefore(lTime)) {
      greeting = "Good Afternoon";
    } else {
      greeting = "Good Morning";
    }
    print(greeting);
    return greeting;
  }
}
