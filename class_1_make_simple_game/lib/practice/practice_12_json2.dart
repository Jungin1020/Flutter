import 'dart:convert';

final String json = '''{
  "name": "Jung in",
  "email": "jungin@gmail.com"}''';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

void main() {
  Map<String, dynamic> nameEmail = jsonDecode(json);
  User user = User.fromJson(nameEmail);
  // print(user.runtimeType); // User의 인스턴스가 된 Json 데이터
  // print('name: ${user.name}, email: ${user.email}');

  Map<String, dynamic> nameEmail2 = user.toJson();
  String json2 = jsonEncode(nameEmail2);
  print(nameEmail2);
  print(json2);
}
