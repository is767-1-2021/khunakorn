
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemModel extends ChangeNotifier {

  String? _category;
  String? _description;
  int? _amount;
  DateTime? _createdDateTime;

  List<ItemDB>? _itemList = [];

  get category => _category;
  set category(value) {
    _category = value;
    notifyListeners();
  }

  get description => _description;
  set description(value) {
    _description = value;
    notifyListeners();
  }

  get amount => _amount;
  set amount(value) {
    _amount = value;
    notifyListeners();
  }

  get createdDateTime => _createdDateTime;
  set createdDateTime(value) {
    _createdDateTime = value;
    notifyListeners();
  }


  addItem(ItemDB value) {
    _itemList!.add(value);
    notifyListeners();
  }

  List<dynamic>? get item => _itemList;
  set itemList(List<dynamic> value) {
    _itemList = value as List<ItemDB>;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['amount'] = amount;
    data['category'] = category;
    data['createdDateTime'] = createdDateTime;

    return data;
  }
}

class ItemDB {
  ItemDB(
      {this.description,
      this.amount,
      this.category,
      this.createdDateTime});

  String? description;
  int? amount;
  String? category;
  DateTime? createdDateTime;
}
