import 'package:dart_basic/practice/practice_16_network/class/mask/data_source/mask_api.dart';
import 'package:dart_basic/practice/practice_16_network/class/mask/mapper/mask_mapper.dart';
import 'package:dart_basic/practice/practice_16_network/class/mask/mask_dto/mask_dto.dart';

import 'model/mask.dart';

void main() async {
  // Api 통신
  final api = MaskApi();

  // Json을 Dto로
  final MaskDto dto = await api.getMaskInfoResult();

  // Dto에서 필요한 내용을 mapper를 통해 Model class로 변환
  final List<Mask> masks = dto.stores?.map((e) => e.toMask()).toList() ?? [];

  // 활용
  masks.forEach((e) {
    print(e.name);
  });
}
