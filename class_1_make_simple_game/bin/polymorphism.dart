abstract interface class Drawable {
  void draw();
}

abstract interface class Movable {
  void move(int seconds);
}

class House implements Drawable {
  @override
  void draw() {
    // TODO: implement draw
    print('   /\\');
    print('  /  \\');
    print(' /    \\');
    print('/______\\');
    print('|      |');
    print('|  []  |');
    print('|______|');
  }
}

class Cat implements Drawable, Movable {
  @override
  void draw() {}

  @override
  void move(int seconds) {
    // TODO: implement move
  }
}

void main() {
  final house = House();
  house.draw();

  final cat = Cat();

  Drawable building = House(); // houae is drawable

  List<Movable> movables = [cat];

  List<Drawable> drawables = [cat, house];
}
