class Word {
  String word = '';

  bool isVowel(int i) {
    return 'aeiou'.contains((word.substring(i, i + 1)).toLowerCase());
    // return 'aeiou'.contains(word.substring(i, i + 1));
  }
}

void main() {
  Word word = Word();
  word.word = 'Apple';

  print(word.isVowel(0));
  print(word.isVowel(1));
  print(word.isVowel(2));
  print(word.isVowel(3));
  print(word.isVowel(4));
}
