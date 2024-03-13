/*
  Checks when the next alignment of Month/Date/Day occurs,
  or if it's even possible.
*/

import 'dart:io';

void main(List<String> args) {
  DateTime inputDate = new DateTime.now();

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

  print(inputDate);

  // For each year following, check if month/date/day of the next is the same.
  // If same:
  //  return it.
  //  -- End of program. --
  // Else:
  //  check all past records if they have the same:
  //    day of the week; and
  //    years until the next leap year (ex. 2025 = 1; 2028 = 0);
  //  if there's a match
  //    return no other year
  //  -- End of Program. --
  //  else:
  //    loop again.
}
