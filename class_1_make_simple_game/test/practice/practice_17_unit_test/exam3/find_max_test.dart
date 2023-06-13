import 'package:dart_basic/practice/practice_17_unit_test/exam3/find_max.dart';
import 'package:test/test.dart';

void main() {
  final List<int> numbers1 = [1, -2, 3, -4];
  final List<int> numbers2 = [123, 45767, 8797];
  final List<int> numbers3 = [];

  test('가장 큰 값을 잘 반환하는지 확인', () {
    expect(findMaxValue(numbers1), 3);
    expect(findMaxValue(numbers2), 45767);
    expect(() => findMaxValue(numbers3), throwsArgumentError);
  });
}
