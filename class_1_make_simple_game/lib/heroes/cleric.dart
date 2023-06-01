import 'dart:math';

class Cleric {
  // 메모리 효울을 위해 필드를 공유
  // static final int maxHp = 50;
  static const maxHp = 50;
  // static final int maxMp = 10;
  static const maxMp = 10;
  String name;

  // int hp = 50;
  int hp;

  // int mp = 3;
  int mp;

  // 인자 이름을 쓰지 않기 위해선 대괄호를 써야한다.
  // Cleric(this.name, {this.hp = Cleric.maxHp, this.mp = Cleric.maxMp});
  // Cleric(this.name, [this.hp = Cleric.maxHp, this.mp = Cleric.maxMp]);
  Cleric(this.name, [this.hp = maxHp, this.mp = maxMp]);

  // MP를 5 소비하는 것으로 자신의 HP를 최대 HP까지 회복할 수 있다.
  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
      print('Your HP is Max!');
    } else {
      // MP가 부족하면 스킬을 사용 못한다.
      print("You're short of MP's");
    }
  } // 이 메소드는 인수가 없고,리턴값도 없다.

  // 기도한 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한만큼 MP를 회복하는 메서드
  int pray(int sec) {
    // dynamic 안되게 주의
    // 회복량은 기도한 시간(초)에 랜덤하게 0 ~ 2 포인트의 보정을 한 양이다
    int heal = sec + Random().nextInt(3);

    // 최대 MP 보다 더 회복하는 것은 불가능 하다.
    if (mp + heal >= maxMp) {
      mp = maxMp;
    } else {
      mp += heal;
    }
    print('Praying!');

    return mp;
  }
}

void main() {
  Cleric cleric = Cleric('Cleric', 10, 10);
  cleric.selfAid();
  int mp = cleric.pray(3);
  if (mp != Cleric.maxMp) {
    print('Your MP is $mp!');
  } else {
    print('Your MP is Max!');
  }
}

// >>>
// Your HP is Max!
// Praying!
// Your MP is Max!
// >>>
