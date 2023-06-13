import 'package:dart_basic/practice/practice_17_unit_test/exam1/bank.dart';
import 'package:test/test.dart';

void main() {
  test('Json이 Model Class로 잘 변경되는지 확인', () {
    final Bank bank = Bank.fromJson(json);

    expect(bank.name, '홍길동');
    expect(bank.address, '서울시 어쩌구 저쩌구');
    expect(bank.phone, '010-1111-2222');
  });

  test('Model Class가 Json으로 잘 변경되는지 확인', () {
    final Bank bank = Bank.fromJson(json);
    final Map<String, dynamic> bankJson = bank.toJson();

    expect(bankJson['name'], '홍길동');
    expect(bankJson['address'], '서울시 어쩌구 저쩌구');
    expect(bankJson['phone'], '010-1111-2222');
  });
}
