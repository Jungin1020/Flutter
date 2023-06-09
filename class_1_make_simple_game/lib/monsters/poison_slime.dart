import '../heroes/hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  PoisonSlime(super.suffix);

  // int poisonLeft = 5;
  // 남이 고칠 수 없게 숨깁니다.
  // private이 디폴트인 방향으로
  int _poisonLeft = 5;

  @override
  void attack(Hero hero) {
    // print('$suffix슬라임이 공격했다!');
    // print('10의 데미지');
    // hero.hp -= 10;
    // // 여기까지가 그냥 슬라임 attack과 똑같은데 하드코딩 안하고 가져오는 방법은 없을까요?
    super.attack(hero); // 이렇게 하는 거구나!

    if (_poisonLeft > 0) {
      print('추가로, 독 포자를 살포했다!');
      // 몫 계산하는 연산자
      final poisonDamage = hero.hp ~/ 5;

      print('독 데미지 : $poisonDamage');
      hero.hp -= poisonDamage;
      // hero.hp = hero.hp * 4 ~/ 5;
      print('$poisonDamage 포인트의 데미지');
      // poisonLeft -= 1;
      _poisonLeft--;
    } else {
      print('독이 부족하다!');
    }
  }
}

void main() {
  final poisonSlime = PoisonSlime('포이즌');
  final hero = Hero('배트맨', 50);

  for (int i = 0; i < 3; i++) {
    poisonSlime.attack(hero);
    print('배트맨 HP : ${hero.hp}');
    print('-----------------------');
  }
}
