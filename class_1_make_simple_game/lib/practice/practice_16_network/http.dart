import 'dart:convert';

import 'package:http/http.dart' as http;
// as http 를 안쓰면 http.get 이 아니라 .get 탑 레벨 메서드들만 쓰게 되기 떄문에

void main() async {
  print(await getTodo());
}

Future<Map<String, dynamic>> getTodo() async {
  final http.Response response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //응답에 대한 정보를 가지고 있음
  return jsonDecode(response.body);

  // print(json);
}
