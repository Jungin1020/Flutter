abstract interface class X {
  void a();
}

// 추상클래스에서는 implements해도 오버라이딩 안해도 된다.
abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {
  X obj = A();
  obj.a(); // a만 가능하다. X에는 a밖에 없으니까.

  Y y1 = A();
  Y y2 = B();

  y1.a(); // Aa
  y2.a(); // Ba
}

// 맨 앞에 적힌 X와 Y, A, B가 가진 메서드가 무엇인지로 기능이 결정되고
// 결과값은 A, B에 오버라이딩된 값으로 나온다.
