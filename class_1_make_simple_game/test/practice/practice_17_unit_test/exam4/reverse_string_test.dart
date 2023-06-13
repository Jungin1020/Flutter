import 'package:dart_basic/practice/practice_17_unit_test/exam4/reverse_string.dart';
import 'package:test/test.dart';

void main() {
  final word1 = 'Apple';
  final word2 = 'I donna Flutter~';
  final word3 = '';

  test('글자가 거꾸로 나오는지 확인', () {
    expect(reverseString(word1), 'elppA');
    expect(reverseString(word2), '~rettulF annod I');
    expect(reverseString(word3), '');
  });
}
