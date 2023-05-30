import '../units/mech_unit.dart';
import 'terran.dart';

class Scv extends Terran implements MechUnit {
  Scv(super.name, super.hp);

  void fixMechanic(MechUnit value) {}
}
