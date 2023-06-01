import 'dart:convert';

class User {
  String name;
  String email;

  User(this.name, this.email);

  // 직렬화
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

  // 역직렬화
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];
}

void main() {
  // 실제 내가 받는 데이터
  String jsonString =
      '{"name": "홍길동", "email": "jungin@gmail.com"}'; // , 콤마 안들어가게 주의

  // jsonString => Map<String, dynamic>
  Map<String, dynamic> json =
      jsonDecode(jsonString); //jsonDecode dynamic 리턴함, 아주 위험

  print(json['name']);
  print(json['email']);
  // 간단할 땐 괜찮지만 평소엔 위험한 방법
  // 클래스를 만들어서 쓰는게 좋다.

  User user = User.fromJson(json);

  print(user.name);
  print(user.email);

  user.name = '최정인';

  print(user.toJson());

  // json을 string으로 변환
  // .toJson에서 직렬화
  String userString = jsonEncode(user.toJson());

  print(userString);
}
