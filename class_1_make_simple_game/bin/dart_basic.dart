import 'heroes/hero.dart';
import 'monsters/slime.dart';
import 'tools/sword.dart';

void main() {
  Hero hero = Hero('Batman', 100); // 인스턴스 생성, new Hero() 라고 썼었는데 지금은 ㄴㄴ
  //Hero hero2 = Hero('Joker', 200);
  //var hero3 = Hero('Dent', 80);

  //final hero4 = Hero('Ridler', 90); // 왠만하면 상수로 간다, 그러다 갈아엎을 일 있으면 변수로 간다.

  final hero1 = Hero('o', 100);
  final hero2 = hero1;

  hero2.hp = 200;

  print(hero1.hp);
  print(hero2.hp);

  final sword = Sword(name: "메소드", damage: 10);
  hero1.sword = sword;

  // primary constructor 기본 생성자
  final slime = Slime('A');

  print(Hero.money);

  // hero.attack();
  // hero.sleep();
}
