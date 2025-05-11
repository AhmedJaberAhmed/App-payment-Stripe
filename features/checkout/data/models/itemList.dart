import 'item.dart';

class ItemList {
  final List<Item> items;

  ItemList({
    required this.items,
  });

  factory ItemList.fromJson(Map<String, dynamic> json) {
    var itemList = (json['items'] as List)
        .map((itemJson) => Item.fromJson(itemJson))
        .toList();
    return ItemList(items: itemList);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}


// Optionally, if you want to include shipping address:
