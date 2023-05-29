import '../units/bio_unit.dart';
import '../skills/healable.dart';
import 'terran.dart';

class Medic extends Terran implements BioUnit, Healable {
  Medic(super.name, super.hp);

  @override
  void heal(BioUnit value) {
    // TODO: implement heal
  }
}
