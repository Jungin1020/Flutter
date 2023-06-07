// // 임의로 Future 함수를 만들어 보았습니다.
// void main() {
//   print('start');
//
//   Future.delayed(Duration(seconds: 2), () {
//     print("sorry I'm late");
//   });
//
//   print('end');
// }

// Future의 then() 함수를 이용하여 코드 작성한 순서대로 실행시켰습니다.
Future<void> saveDb(user) async {
  print('saving $user to db');
}

Future<void> sendEmail(user) async {
  await Future.delayed(Duration(seconds: 2));
  // await Future.error(Exception('error save db'));
  print('sending email to $user');
}

Future<String> getResult(user) async {
  return 'seccess register $user';
}

final user = {
  'email': 'aaa@aaa.com',
  'password': '1234',
  'name': 'Jung',
};

// // 1. then을 사용하는 방법
// void main() {
//   saveDb(user)
//       .then((_) => sendEmail(user))
//       .catchError((err) => print('save db error: $err'))
//       // .catchError((err) => throw Exception('error send email'))
//       .then((_) => getResult(user))
//       .then((value) => print(value))
//       .whenComplete(() => print('completed!'));
// }

// 2. async - await을 사용하는 방법
Future<String> register(user) async {
  // await를 붙이기 위해서는 Future 함수여야합니다.
  await saveDb(user);
  await sendEmail(user);
  return getResult(user);
}

// await을 안 붙이고 병렬 처리 되도록 실행해봤습니다.
Future<String> register2(user) async {
  // await를 붙이기 위해서는 Future 함수여야합니다.
  saveDb(user);
  sendEmail(user);
  return getResult(user);
}

void main(List<String> arguments) async {
  Stopwatch stopwatch = Stopwatch()..start();
  final result = await register(user);
  print(stopwatch.elapsed);

  Stopwatch stopwatch2 = Stopwatch()..start();
  final result2 = await register2(user);
  print(stopwatch2.elapsed);

  // print(result);
  // print(result2);
}
