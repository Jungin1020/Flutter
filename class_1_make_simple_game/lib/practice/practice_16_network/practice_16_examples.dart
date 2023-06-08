import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'model/movie_detail.dart';
import 'package:http/http.dart' as http;

import 'model/movie_info.dart';

void main() async {
  // 연습문제 1 ========================================================
  final movieInfos = await getMovieInfos();
  final String movieJson = jsonEncode(movieInfos.toJson());

  // print(movieJson);

  // 연습문제 2 ========================================================
  final movieDetail = await getMovieDetails(840326);
  final String movieDetailJson = jsonEncode(movieDetail.toJson());

  // print(movieDetailJson);

  // 연습문제 3 & 4 & 6 ================================================

  final String imageUrl = 'https://alimipro.com/favicon.ico';
  final String fallbackImageUrl = 'https://alimipro.com/assets/ios_capture.png';

  print('다운로드 시작');

  Stopwatch stopwatch = Stopwatch()..start();
  final Uint8List imageData = await downloadImage(imageUrl, fallbackImageUrl);
  stopwatch.stop();

  print('다운로드 끝');
  print('================');
  print('소요시간 : ${stopwatch.elapsed}');
  print('용량 : ${imageData.lengthInBytes}');

  final File imagePath = await saveFile(imageData, 'favicon_copy.png');
  // 타겟 url을 틀리게 만들고 대체 이미지를 저장했는데 보이질 않는다. 안드로이드 스튜디오에선 안보이는 건가?

  // 연습문제 5 ========================================================
  print('');
  print('비동기 다운로드 시작');

  Stopwatch stopwatch2 = Stopwatch()..start();
  await downloadImage(imageUrl, fallbackImageUrl);
  await downloadImage(imageUrl, fallbackImageUrl);
  await downloadImage(imageUrl, fallbackImageUrl);
  stopwatch2.stop();

  print('다운로드 끝');
  print('================');
  print('소요시간 : ${stopwatch2.elapsed}'); // 소요시간 : 0:00:00.071352
  print('용량 : ${imageData.lengthInBytes}');

  print('');
  print('동기 다운로드 시작');

  Stopwatch stopwatch3 = Stopwatch()..start();
  downloadImage(imageUrl, fallbackImageUrl);
  downloadImage(imageUrl, fallbackImageUrl);
  downloadImage(imageUrl, fallbackImageUrl);
  stopwatch3.stop();

  print('다운로드 끝');
  print('================');
  print('소요시간 : ${stopwatch3.elapsed}'); // 소요시간 : 0:00:00.000164
  print('용량 : ${imageData.lengthInBytes}');
}

// 연습문제 1 ================================================================
Future<Movie> getMovieInfos() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  Map<String, dynamic> jsonMap = jsonDecode(response.body);
  return Movie.fromJson(jsonMap);
}

// 연습문제 2 ================================================================
Future<MovieDetail> getMovieDetails(int movieId) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  Map<String, dynamic> jsonMap = jsonDecode(response.body);
  return MovieDetail.fromJson(jsonMap);
}

// 연습문제 3 & 연습문제 6 ================================================
Future<Uint8List> downloadImage(String url, String fallbackUrl) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final imageData = response.bodyBytes;
    return Uint8List.fromList(imageData);
  } else {
    final fallbackResponse = await http.get(Uri.parse(fallbackUrl));
    final fallbackImageData = fallbackResponse.bodyBytes;
    return Uint8List.fromList(fallbackImageData);
    // throw Exception('이미지 가져오기 실패. 상태 코드: $response');
  }
}

Future<File> saveFile(Uint8List imageData, String fileName) async {
  final directory = Directory.current;
  final imagePath =
      '${directory.path}/lib/practice/practice_16_network/$fileName';

  final File imageFile = File(imagePath);
  await imageFile.writeAsBytes(imageData);

  return imageFile;
}
