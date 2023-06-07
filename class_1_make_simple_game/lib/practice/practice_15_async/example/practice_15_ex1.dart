// import 'dart:io';
// // import 'package:csv/csv.dart';
//
// // sample.csv 를 불러온다
// // 파일이 없으면 예외처리한다
// Future<String> readCsv() async {
//   try {
//     final file = File('lib/practice/practice_15_async/sample.csv');
//     print(file.readAsLines());
//
//     return '';
//     // return CsvToListConverter().convert(lines.join('\n'));
//   } catch (e) {
//     return 'An error occurred while reading the file: $e';
//   }
// }
//
// Future<void> main() async {
//   final String a = await readCsv();
//   print(a);
// }

// '한석봉' 이라는 문자열이 있는지 찾고
// true 이면 '김석봉'으로 수정
// sample_copy.csv 로 저장한다
// async await 사용
