class Wand {
  String _name;
  double power;

  String get name => _name;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('Too short name.');
    }

    _name = value;
  }

  Wand(this._name, {required this.power}) {
    if (power < 0.5 || power > 100.0) {
      throw Exception("Wand's power value should be between 0.5 and 100.0 ");
    }
  }
}
