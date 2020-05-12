class Shared {
  setMobileNumber(String phoneNumber) {
    phoneNumber = "+94" + phoneNumber;
    return phoneNumber;
  }

  countDates(DateTime dateFrom, DateTime dateTo) {
    return dateFrom.difference(dateTo).inDays;
  }

  countWeeks(DateTime date) {
    int dates = DateTime.now().difference(date).inDays;
    int weeks;
    if (dates % 7 == 0) {
      weeks = (dates / 7).toInt();
    } else {
      weeks = (dates / 7).toInt() + 1;
    }
    return weeks;
  }

  countMonths(DateTime date) {
    int dates = DateTime.now().difference(date).inDays;
    int months;
    if (dates % 30 == 0) {
      months = (dates / 30).toInt();
    } else {
      months = (dates / 30).toInt() + 1;
    }
    return months;
  }
}
