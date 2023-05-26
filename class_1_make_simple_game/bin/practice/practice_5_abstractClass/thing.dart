abstract interface class Thing {
  double _weight;

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  Thing(this._weight);
}

// abstract interface class Thing {
//   double get weight;
//   set weight(double value);
// }
