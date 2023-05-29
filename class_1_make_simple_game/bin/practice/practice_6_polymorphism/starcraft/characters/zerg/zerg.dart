import '../character.dart';

abstract class Zerg extends Character {
  // 이거 생물 유닛으로 넣어야할까요...
  Zerg(super.name, super.hp);

  void autoHeal() {}
}
