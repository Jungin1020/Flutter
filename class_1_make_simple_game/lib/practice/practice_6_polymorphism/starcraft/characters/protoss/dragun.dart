import '../units/mech_unit.dart';
import 'protoss.dart';

class Dragun extends Protoss implements MechUnit {
  @override
  int shieldHp;

  @override
  void fixShield() {
    // TODO: implement fixShield
    print('Yep');
  }

  Dragun(this.shieldHp) : super('', 0); // 이게 뭘까요?
}
