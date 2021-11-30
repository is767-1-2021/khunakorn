import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String description;
  final String category;
  final DateTime createdDateTime;
  final int amount;

  Item(this.description, this.category, this.createdDateTime, this.amount);


  factory Item.fromJson(
    Map<String, dynamic> json,
  ) {
    return Item(
      json['description'] as String,
      json['category'] as String,
      json['createdDateTime'].toDate() as DateTime,
      json['amount'] as int,
    );
  }
}

class AllItems {
  final List<Item> items;
  AllItems(this.items);

  factory AllItems.fromJson(List<dynamic> json) {
    List<Item> items;

    items = json.map((index) => Item.fromJson(index)).toList();

    return AllItems(items);
  }

  factory AllItems.fromSnapshot(QuerySnapshot s) {
    List<Item> items = s.docs.map((DocumentSnapshot pk) {
      return Item.fromJson(pk.data() as Map<String, dynamic>);
    }).toList();

    return AllItems(items);
  }
}