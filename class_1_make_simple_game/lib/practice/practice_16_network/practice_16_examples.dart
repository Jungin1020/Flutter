import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'model/movie_detail.dart';
import 'package:http/http.dart' as http;

import 'model/movie_info.dart';

void main() async {
  // 연습문제 1
  final movieInfos = await getMovieInfos();
  final String movieJson = jsonEncode(movieInfos.toJson());

  // print(movieJson);

  // 연습문제 2
  final movieDetail = await getMovieDetails(840326);
  final String movieDetailJson = jsonEncode(movieDetail.toJson());

  print(movieDetailJson);

  // 연습문제 3

  final String imageUrl = 'https://alimipro.com/favicon.ico';
  final Uint8List imageData = await downloadImage(imageUrl);
  final File imagePath = await saveFile(imageData, 'favicon_copy.ico');
}

// 연습문제 1
Future<Movie> getMovieInfos() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  Map<String, dynamic> jsonMap = jsonDecode(response.body);
  return Movie.fromJson(jsonMap);
}

// 연습문제 2
Future<MovieDetail> getMovieDetails(int movieId) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  Map<String, dynamic> jsonMap = jsonDecode(response.body);
  return MovieDetail.fromJson(jsonMap);
}

// 연습문제 3
Future<Uint8List> downloadImage(String url) async {
  // final String imageUrl = 'https://alimipro.com/favicon.ico';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final imageData = response.bodyBytes;
    return Uint8List.fromList(imageData);
  } else {
    throw Exception('이미지 가져오기 실패. 상태 코드: $response');
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
