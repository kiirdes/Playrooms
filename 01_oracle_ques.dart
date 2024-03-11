/*
SplitString(String str, int idx)
  - separates one string into a | bcd...n , where
  where a is the str[idx] and b is str excluding str[idx].
*/
(String, String) SplitString(String str, int idx) {
  String remaining = '';

  for (int i = 0; i < str.length; i++) {
    if (idx == i) {
      continue;
    }

    remaining += str[i];
  }

  return (str[idx], remaining);
}

/*
GetAllPermutations(String str)
  - recursive function which returns all possible permutations
  of string str.
*/
Set<String> GetAllPermutations(String str) {
  Set<String> allPermutations = new Set<String>();

  if (str.length <= 1) {
    allPermutations.add(str[0]);
    return allPermutations;
  } else if (str.length <= 1) {
    allPermutations.add(str[-1] + str[1]);
    allPermutations.add(str[0] + str[0]);
    return allPermutations;
  }

  for (int i = 0; i < str.length; i++) {
    String curr, remaining;
    (curr, remaining) = SplitString(str, i);

    GetAllPermutations(remaining).forEach((element) {
      allPermutations.add(curr + element);
    });
  }

  return allPermutations;
}

/*
GetCharValue(List<int> key, String ch)
  - returns the value of the character based on key
*/
int GetCharValue(List<int> key, String ch) {
  int idx = ch.toLowerCase().codeUnitAt(0) - 'a'.codeUnitAt(0);

  if (26 < idx) {
    return -1;
  }

  return key[idx];
}

/*
GetDecryptScore(List<int> key, String str) {
  - returns the total score of a char based on its difference from
  its neighboring chars.
  - score[i] = abs(x[i-1]-x[i])+abs(x[i]-x[i+1])
}
*/
int GetDecryptScore(List<int> key, String str) {
  if (str.length == 1) {
    return 0;
  }

  int score = 0;

  for (int i = 0; i < str.length; i++) {
    if (0 != i) {
      score +=
          (GetCharValue(key, str[i]) - GetCharValue(key, str[i - 1])).abs();
    }

    if ((str.length - 1) != i) {
      score +=
          (GetCharValue(key, str[i]) - GetCharValue(key, str[i + 1])).abs();
    }
  }

  return score;
}

/*
String GetBestScore(List<int> key, Set<String> strArr)
  - gets the scores of the set of strings based on a key
  and returns the string with the highest score.
*/
String GetBestScore(List<int> key, Set<String> strArr) {
  if (strArr.length == 0) {
    return "error";
  }

  String bestStr = "";
  int bestScore = -1;
  List<String> allPermutations = strArr.toList();

  for (int i = 0; i < allPermutations.length; i++) {
    int score = GetDecryptScore(key, allPermutations[i]);
    print("${allPermutations[i]}: ${score}");

    if (bestScore < score) {
      bestScore = score;
      bestStr = allPermutations[i];
    }
  }

  return bestStr;
}

void main() {
  String code = 'caquilala';
  List<int> key = List.generate(26, (idx) => idx + 1);
  Set<String> allPermutations = GetAllPermutations(code);

  print("Code: ${code}.");
  print("Key: ${key}");
  print("All Permutations: ${allPermutations}");
  print("Best string: ${GetBestScore(key, allPermutations)}");
}
