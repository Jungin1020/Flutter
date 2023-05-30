import 'characters/terran/marine.dart';
import 'characters/units/bio_unit.dart';

void main() {
  Marine marine1 = Marine('marine', 10);
  Marine marine2 = Marine('marine', 10);
  Marine marine3 = Marine('marine', 10);

  List<BioUnit> group = [marine1, marine2, marine3];
}
