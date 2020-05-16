import 'package:pregnancy_tracking_app/shared/timeCalculate.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class Pregnancy {
  int days;
  int weeks;
  int months;
  int dueDays;
  int dueWeeks;

  updateValue(User currentUser) {
    TimeCalculate time = TimeCalculate();
    days = time.countDates(DateTime.now(), currentUser.lastPeriodDate);
    weeks = time.countWeeks(currentUser.lastPeriodDate);
    months = time.countMonths(currentUser.lastPeriodDate);
    dueDays = time.countDates(currentUser.dueDate, DateTime.now().add(Duration(days: -1)));
  }
}
