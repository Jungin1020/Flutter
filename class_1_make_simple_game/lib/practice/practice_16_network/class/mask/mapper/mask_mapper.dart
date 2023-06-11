import 'package:dart_basic/practice/practice_16_network/class/mask/mask_dto/mask_dto.dart';
import 'package:dart_basic/practice/practice_16_network/class/mask/model/mask.dart';

extension ToMask on Stores {
  Mask toMask() {
    return Mask(
      address: addr ?? '',
      lat: lat ?? 0.0,
      lng: lng ?? 0.0,
      name: name ?? '이름 없음',
      remainStatus: remainStat ?? '알 수 없음',
    );
  }
}
