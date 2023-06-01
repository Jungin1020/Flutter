import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}

class Department {
  String name;
  Employee leader;

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };

  Department(this.name, this.leader);
}

void main() {
  Employee employee = Employee('홍길동', 41);
  Department department = Department('총무부', employee);

  final departJson = jsonEncode(department.toJson());
  final myJson = File('lib/practice/ect/길동이.json');

  myJson.writeAsStringSync(departJson);

  print('직렬화: $departJson');

  Map<String, dynamic> departMap = jsonDecode(departJson);

  print('역직렬화: $departMap');
  print(departMap['name']);
}
