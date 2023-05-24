import '../tools/sword.dart';

class Hero {
  // field
  static int money = 100; // 정적 자금이 된다. 모든 히어로가 공유, 인스턴스 안 만들어도 시용됨, 정적 변수
  String name;
  int _hp;
  Sword? sword; // 칼이 있을 수도 없을 수도

  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
      throw Exception('안돼');
    }
  }

  // 생성자, 필드와 메서드 사이
  // Hero({required this.name, required this.hp, this.sword});
  Hero(this.name, this._hp, {this.sword}); //둘 중 하나

  // 클래스 안에 작성한 람수 = 메서드
  void attack() {
    //void has no return
    if (sword == null) {
      print('주먹 퉁퉁');
    } else {
      print('${sword?.name} 칼로 ${sword?.damage} 떄린다'); // ?로 널 안전성 확인
    }
  }

  void run() {}

  void sleep() {
    hp = 100;
    //String interpolation
    print('$name은 잠을 자고 회복했다!');
  }
}
