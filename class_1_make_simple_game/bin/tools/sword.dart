class Sword {
  String name;
  int damage;

  Sword({
    // 중괄호 named parameter (이름있는 인자), 이 때 required는 필수다. required 빼면 null 허용인데 복잡해진다
    required this.name,
    required this.damage,
  });
}
