import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  Computer(super.name, super.price, super.color, super.weight, this.makerName);

  String makerName;
}
