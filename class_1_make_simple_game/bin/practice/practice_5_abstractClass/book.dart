import 'tangible_asset.dart';

class Book extends TangibleAsset {
  Book(super.name, super.price, super.color, super.weight, this.isbn);

  String isbn;
}
