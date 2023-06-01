import '../units/bio_unit.dart';
import 'terran.dart';

class Medic extends Terran implements BioUnit {
  Medic(super.name, super.hp);

  void heal(BioUnit value) {}
}
