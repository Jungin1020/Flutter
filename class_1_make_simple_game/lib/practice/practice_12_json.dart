import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };
}

void main() {
  Employee employee = Employee('홍길동', 41);
  Department department = Department('총무부', employee);

  final departJson = jsonEncode(department.toJson());
  final myJson = File('lib/practice/ect/길동이.json');

  myJson.writeAsStringSync(departJson);

  print('직렬화: $departJson');

  Map<String, dynamic> departMap = jsonDecode(departJson);
  Department department2 = Department.fromJson(departMap);

  print('역직렬화: $department2');
  print(department2.name);
  print(department2.leader.name);
}
