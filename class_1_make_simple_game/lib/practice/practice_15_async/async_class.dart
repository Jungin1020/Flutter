Future<void> main() async {
  print('start');
  final delay = Future.delayed(Duration(seconds: 5), () {
    // 5초 후에 일어날 일
    print('5초 끝');
  }); //생성자
  // 임의로 만든 비동기 코드
  // Future 시뮬레이션 연습을 위한 코드

  print('end');

  // saveDb(1111)
  //     .then((value) => print(value))
  //     .catchError((e) => print(e))
  //     .then((value) => print('에러 이후'));
  // // await 때문에 2초 있다가 나옴

  await saveDb(1111); // 비동기에서만 쓸 수 있기 떄문에 main도 비동기로
  // then 쓰면 에러 캐치가 어려움
  // await 써서 try, catch로 잡아버리자
}

Future<int> saveDb(user) async {
  await Future.delayed(Duration(seconds: 2));
  await Future.error(Exception('error'));
  print('에러 통과');
  return 0;
}
