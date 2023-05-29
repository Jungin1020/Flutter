import '../character.dart';

abstract class Protoss extends Character {
  Protoss(super.name, super.hp);

  int get shieldHp;

  set shieldHp(int value);

  void fixShield();
}
