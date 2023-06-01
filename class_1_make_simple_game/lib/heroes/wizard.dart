import '../tools/wand.dart';
import 'hero.dart';

class Wizard {
  String _name;
  int hp;
  int mp;
  Wand wand;

  String get name => _name;

  // 인스턴스 생성 때는 setter를 통과하지 않습니다. 이럴수가!
  set name(String value) {
    // 이름의 길이가 3 미만이면 에러가 납니다.
    if (value.length < 3) {
      throw Exception('Too short name.');
    }

    _name = value;
  }

  Wizard(
    this._name,
    this.wand, {
    required this.mp,
    required this.hp,
  }) {
    if (mp < 0) {
      throw Exception('MP should be more than 0.');
    }
    // HP가 음수가 되면 0이 됩니다(에러 아님)
    if (hp < 0) {
      hp = 0;
      print('Hp is 0.');
    }
  }

  void heal(Hero hero) {
    hero.hp += 10;
    print('${hero.name}의 hp를 10 회복했다.');
  }
}

void main() {
  //final wand1 = Wand('', power: 0); // power Exception
  final wand2 = Wand('', power: 50);
  // final wizard1 = Wizard('', wand1, hp: -100, mp: 10); // HP is 0
  // final wizard2 = Wizard('', wand2, hp: 10, mp: -1); // MP Exception
  final wizard3 = Wizard('', wand2, hp: 10, mp: 10);
  // wizard.name = 'hh'; // 여기서 Name Exception이 먹힙니다.

  print("Wand's name : ${wand2.name}, Power : ${wand2.power}");
  print(
      "Wizard's name : ${wizard3.name}, HP : ${wizard3.hp}, MP : ${wizard3.mp}");

  // getter와 setter가 같이 있으니까 name, _name이 전부 수정 가능합니다.
  // 캡슐화를 하려면 getter만 있어야 할까요??
  // setter를 지우면 _name은 수정 가능하지만 name은 컴파일에러가 납니다.
  Wizard wizard = Wizard('DDD', wand2, hp: 23, mp: 5);
  wizard._name = 'AAA';
  print(wizard._name);
  wizard.name = 'BBB';
  print(wizard.name);
}

// Hp는 getter / setter로 캡슐화해서 Exception을 적용했더니
// 인스턴스 생성 때는 setter를 통과하지 않아서 Exception이 뜨질 않았습니다.
// 인스턴스 생성 후 값을 변경할 때는 적용이 됩니다.
