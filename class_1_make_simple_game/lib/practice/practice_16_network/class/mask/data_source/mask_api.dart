import 'dart:convert';
import '../mask_dto/mask_dto.dart';
import 'package:http/http.dart' as http;

class MaskApi {
  Future<MaskDto> getMaskInfoResult() async {
    final http.Response response =
        await http.get(Uri.parse('http://104.198.248.76:3000/mask'));
    final json =
        jsonDecode(utf8.decode(response.bodyBytes)); //bodyBytes로 생성한 이유?
    return MaskDto.fromJson(json);
  }
}
