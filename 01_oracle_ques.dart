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

void main() {
  String code = 'abb';
  Set<String> allPermutations = new Set<String>();

  print("Code: ${code}");
  allPermutations = GetAllPermutations(code);
  print("All Permutations: ${allPermutations}");
}
