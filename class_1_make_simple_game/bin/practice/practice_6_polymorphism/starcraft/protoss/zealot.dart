import '../units/bio_unit.dart';
import 'protoss.dart';

class Zealot extends Protoss implements BioUnit {
  @override
  int shieldHp;

  @override
  void fixShield() {
    // TODO: implement fixShield
  }

  Zealot(this.shieldHp) : super('', 0); // 이게 뭘까요?
}
