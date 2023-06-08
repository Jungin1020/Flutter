import 'dart:convert';

import 'package:http/http.dart' as http;
// as http 를 안쓰면 http.get 이 아니라 .get 탑 레벨 메서드들만 쓰게 되기 떄문에

void main() async {
  print(await getTodo(1));

  final response = await getHtml('https://www.google.co.kr/');
  print(response.body);
}

Future<Map<String, dynamic>> getTodo(int id) async {
  final http.Response response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
  //응답에 대한 정보를 가지고 있음
  return jsonDecode(response.body);

  // print(json);
}

Future<http.Response> getHtml(String url) async {
  return await http.get(Uri.parse(url));
}
