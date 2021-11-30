import 'dart:async';
import 'package:final_app/model/item_model.dart';
import 'package:final_app/services/item_service.dart';


class ItemController {
  final Services services;
  List<Item> items = List.empty();


  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  ItemController(this.services);

  Future<List<Item>> fectItems() async {
    onSyncController.add(true);
    items = await services.getItems();
    onSyncController.add(false);
    return items;
  }
}
