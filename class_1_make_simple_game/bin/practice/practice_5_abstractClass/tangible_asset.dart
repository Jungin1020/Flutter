import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  TangibleAsset(super.name, super.price, this.color, this.weight);

  String color;
  @override
  double weight;
}
