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

void main() {
  Dragun d = Dragun(10);
  Protoss dd = Dragun(20);
  d.fixShield();
  dd.fixShield();
}
