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

  if (str.length <= 2) {
    allPermutations.add(str[0] + str[1]);
    allPermutations.add(str[1] + str[0]);
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
    if (0 != i) {}
  }

  return score;
}

void main() {
  String code = 'a';
  List<int> key = [
    2,
    6,
    5,
    8,
    4,
    3,
    6,
    5,
    4,
    6,
    5,
    4,
    5,
    3,
    4,
    2,
    3,
    1,
    2,
    3,
    4,
    2,
    6,
    5,
    3,
    2
  ];
  Set<String> allPermutations = new Set<String>();

  print("Code: ${code}. Key length: ${key.length}");
  allPermutations = GetAllPermutations(code);
  print("All Permutations: ${allPermutations}");
  print("Value of ${code}: ${GetCharValue(key, code[0])}");
}
