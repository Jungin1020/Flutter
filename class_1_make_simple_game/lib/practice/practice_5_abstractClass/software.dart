import 'intangible_asset.dart';

class Software extends IntangibleAsset {
  Software(super.name, super.price, this.language);

  final String language;
}
