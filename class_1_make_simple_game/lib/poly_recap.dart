void main() {
  List<int> list = [1, 2, 3];
  Iterable<int> iterable = [1, 2, 3];

  // iterable = list;
  // list = iterable; // iterable이 더 큰 개념이기 때문

  print(list[0]);
  // print(iterable[0]);
  print(iterable.elementAt(0));

  print(list.hashCode);
  print(iterable.hashCode);

  Map<String, dynamic> person = {
    // dynamic 쓸지 Object 쓸지는 개취
    'name': 'fake',
    'age': 10
  };
}
