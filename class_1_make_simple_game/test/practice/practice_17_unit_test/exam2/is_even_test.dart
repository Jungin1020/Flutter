import 'package:dart_basic/practice/practice_17_unit_test/exam2/is_even.dart';
import 'package:test/test.dart';

void main() {
  test('짝수 판별을 잘 하는지 확인', () {
    expect(isEven(2), true);
    expect(isEven(857487422), true);
    expect(isEven(10001), false);
    expect(isEven(-23782130), true);
    expect(isEven(-11), false);
    expect(isEven(0), true);
    expect(isEven(-0), true);
  });
}
