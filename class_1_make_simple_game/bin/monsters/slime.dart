import '../heroes/hero.dart';

class Slime {
  int hp = 50;
  final String suffix;
  final int level = 10;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix 이/기 공격했다!');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

void main() {
  final slime = Slime('P');
  final hero = Hero('Batman', 20);
  slime.attack(hero);
  print('남은 hp : ${hero.hp}');
}
