import 'package:pregnancy_tracking_app/shared/shared.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class Pregnancy {
  int days;
  int weeks;
  int months;
  int dueDays;
  int dueWeeks;

  updateValue(User currentUser) {
    Shared shared = Shared();
    days = shared.countDates(DateTime.now(), currentUser.lastPeriodDate);
    weeks = shared.countWeeks(currentUser.lastPeriodDate);
    months = shared.countMonths(currentUser.lastPeriodDate);
    dueDays = shared.countDates(currentUser.dueDate, DateTime.now().add(Duration(days: -1)));
  }
}
