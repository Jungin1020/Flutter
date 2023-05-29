import '../../skills/fixable.dart';
import '../units/mech_unit.dart';
import 'terran.dart';

class Scv extends Terran implements MechUnit, Fixable {
  Scv(super.name, super.hp);

  @override
  void fixMechanic(MechUnit value) {
    // TODO: implement fixMechanic
  }
}
