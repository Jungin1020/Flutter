import 'dart:convert';

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

// https://itsallwidgets.com/json-to-dart-converter-support-null-safety

class ChartData {
  final List<CollectionChartDataList> collectionChartDataList;

  ChartData({
    required this.collectionChartDataList,
  });

  ChartData.fromJson(Map<String, dynamic> json)
      : collectionChartDataList = (json['collectionChartDataList'] as List)
            .map((dynamic e) =>
                CollectionChartDataList.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'collectionChartDataList':
            collectionChartDataList.map((e) => e.toJson()).toList()
      };
}

class CollectionChartDataList {
  final String collectionName;
  final List<dynamic> collectionSalePrice;

  CollectionChartDataList({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  CollectionChartDataList.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'] as String,
        collectionSalePrice = json['collectionSalePrice'] as List;

  Map<String, dynamic> toJson() => {
        'collectionName': collectionName,
        'collectionSalePrice': collectionSalePrice
      };
}

void main() {
  Map<String, dynamic> data = jsonDecode(json);
  ChartData chartData = ChartData.fromJson(data);

  print(chartData.collectionChartDataList);
}
