import 'dart:io';

Future<void> findAndReplace(
    String source, String target, String find, String replace) async {
  // 파일에서 문자열을 읽습니다.
  final sourceText = await File(source).readAsString();
  // sourceText에서 find문자를 replace문자로 바꿉니다.
  final targetText = sourceText.replaceAll(find, replace);
  // targetText 값을 받아서 target에 씁니다.
  File(target).writeAsString(targetText);
}

Future<void> main() async {
  await findAndReplace('lib/practice/practice_15_async/sample22.csv',
          'lib/practice/practice_15_async/sample2.csv', '한석봉', '김석봉')
      .catchError((error) {
    print(error);
  });

  print(
      await File('lib/practice/practice_15_async/sample2.csv').readAsString());
}
