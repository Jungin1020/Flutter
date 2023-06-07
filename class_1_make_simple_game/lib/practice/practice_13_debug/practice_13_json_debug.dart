final String json = ''' {
  "collectionChartDataList": [
    {
      "collectionName": "collectionName",
      "collectionSalePrice": []
    },
    {
      "collectionName": "collectionName",
      "collectionSalePrice": [
        {
          "price": 59.75,
          "cvtDatetime": "2023-03-26T08:08:35"
        },
        {
          "price": 60.00,
          "cvtDatetime": "2023-03-26T08:08:45"
        }
      ]
    }
  ]
}''';

class ChartData {
  final List<Map<String, dynamic>> collectionChartDataList;

  ChartData(this.collectionChartDataList);
}

class CollectionData {
  final String collectionName;
  final List<Map<String, dynamic>> collectionSalePrice;

  CollectionData(this.collectionName, this.collectionSalePrice);

  CollectionData.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'],
        collectionSalePrice = json['collectionSalePrice'];
}

class SalePrice {
  final double price;
  final String cvtDatetime;

  SalePrice(this.price, this.cvtDatetime);

  SalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        cvtDatetime = json['cvtDatetime'];

  Map<String, dynamic> toJson() => {
        'price': price,
        'cvtDatetime': cvtDatetime,
      };
}
