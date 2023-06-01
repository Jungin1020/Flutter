// 연습문제2-1에 대한 답 : Set, Map, Map

class Person {
  String name;

  Person(this.name);
}

void main() {
  // '홍길동', '한석봉'  인스턴스를 각각 만들고 List에 담습니다.
  final person1 = Person('홍길동');
  final person2 = Person('한석봉');

  final List<Person> peopleList = [person1, person2];
  // 이름과 나이를 쌍으로 한 Map을 만듭니다.
  final Map<String, int> nameAge = {
    '홍길동': 20,
    '한석봉': 25,
  };

  // nameList.forEach((name) {
  //   print(name);
  // });
  // forEach에 노란 밑줄이 그어지는 이유 >> 추후에 자세히 알아보기

  // List에 담긴 모든 Person의 이름을 표시합니다.
  for (final person in peopleList) {
    print(person.name);
  }

  // Map을 활용하여 모든 Person의 이름과 나이를 출력합니다.
  for (final person in peopleList) {
    print("${person.name}의 나이는 ${nameAge[person.name]}살입니다.");
  }
}
