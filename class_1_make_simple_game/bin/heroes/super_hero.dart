import '../monsters/slime.dart';
import 'hero.dart';

class SuperHero extends Hero {
  SuperHero(super.name, super.hp);

  bool _isFlying = false;

  bool get isFlying => _isFlying;

  set isFlying(bool value) {
    _isFlying = value;
    if (value) {
      print('$name is flying');
    } else {
      print('$name is not flying');
    }
  }

  // 오른클 > generator > overide method 하면 메서드가 떠야하는데 안 뜨네요?
  @override
  void run() {
    print('$name is running very fast!');
  }

  // @override
  // void attack(Slime slime) {
  //   print('$name is attacking $slime');
  //   slime.hp -= 10;
  //
  //   if (isFlying) {
  //     print('$name is attacking $slime');
  //     slime.hp -= 5;
  //     print('Additional five points of damage');
  //   }
  // }
}

void main() {
  final hero = Hero('Hero', 10);
  hero.run();
  final batman = SuperHero('Batman', 100);
  batman.run();
}
