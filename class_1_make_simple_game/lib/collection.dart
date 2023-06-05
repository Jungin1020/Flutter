class Collection {
  Collection({
    this.collectionChartDataList,
  });

  Collection.fromJson(dynamic json) {
    if (json['collectionChartDataList'] != null) {
      collectionChartDataList = [];
      json['collectionChartDataList'].forEach((v) {
        collectionChartDataList?.add(CollectionChartDataList.fromJson(v));
      });
    }
  }
  List<CollectionChartDataList>? collectionChartDataList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (collectionChartDataList != null) {
      map['collectionChartDataList'] =
          collectionChartDataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CollectionChartDataList {
  CollectionChartDataList({
    this.collectionName,
    this.collectionSalePrice,
  });

  CollectionChartDataList.fromJson(dynamic json) {
    collectionName = json['collectionName'];
    collectionSalePrice = json['collectionSalePrice'];
  }
  String? collectionName;
  dynamic collectionSalePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['collectionName'] = collectionName;
    map['collectionSalePrice'] = collectionSalePrice;
    return map;
  }
}
