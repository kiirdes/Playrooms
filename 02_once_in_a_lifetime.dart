/*
  Checks when the next alignment of Month/Date/Day occurs,
  or if it's even possible.
*/

String GetDayString(int day) {
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  return days[day - 1];
}

String GetMonthString(int month) {
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  return months[month - 1];
}

(int, int) GetResetScore(DateTime date) {
  return (date.year % 4, date.weekday);
}

bool HasLooped(Set<(int, int)> completed, (int, int) curr) {
  return completed.contains(curr);
}

String GetFormattedDate(DateTime date) {
  return "${GetDayString(date.weekday)}; ${GetMonthString(date.month)} ${date.day}, ${date.year}";
}

void main(List<String> args) {
  DateTime inputDate = new DateTime.now();
  DateTime matchDate = new DateTime(2000);
  Set<(int, int)> completed = Set();
  bool hasMatch = false;

  if (args.length != 1) {
    print("Usage: > run [date] [-n]");
    print("         date - date in YYYY-MM-DD format");
    print("         n    - use DateTime.now()");
    return;
  }

  if (args[0] != '-n') {
    List<String> splitInput = args[0].split("-");
    inputDate = DateTime(int.parse(splitInput[0]), int.parse(splitInput[1]),
        int.parse(splitInput[2]));
  }

  print("You input: ${GetFormattedDate(inputDate)}.\n");

  int counter = 1;
  while (counter != 100) {
    DateTime newDate =
        new DateTime(inputDate.year + counter, inputDate.month, inputDate.day);

    (int, int) curr = GetResetScore(inputDate);
    if (newDate.weekday == inputDate.weekday) {
      hasMatch = true;
      matchDate = newDate;
      break;
    }

    if (HasLooped(completed, curr)) break;
    counter++;
  }

  if (hasMatch) {
    print("It's a match!");
    print("${GetFormattedDate(inputDate)}");
    print("${GetFormattedDate(matchDate)}");
  } else {
    print("No matches for ${GetFormattedDate(inputDate)}.");
    print("That day is one of a kind!");
  }
}
