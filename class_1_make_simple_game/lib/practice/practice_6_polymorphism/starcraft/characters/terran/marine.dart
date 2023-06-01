import '../units/bio_unit.dart';
import 'terran.dart';

class Marine extends Terran implements BioUnit {
  Marine(super.name, super.hp);
}

void main() {
  BioUnit marine = Marine('marine', 10);
}
