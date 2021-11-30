import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/item_model.dart';
import 'package:final_app/model/item_model2.dart';


abstract class Services {
  Future<List<Item>> getItems();
  Future<String> addItem(Item value);
}

class FirebaseServices extends Services {
  @override
  Future<List<Item>> getItems() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('final_app').get();

    AllItems items = AllItems.fromSnapshot(snapshot);
    return items.items;
  }

  @override
  Future<List<ItemDB>> getFromFirebase(String? timestamp) async {
    print('getFromFirebase $timestamp');
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('final_app').get();
    List<ItemDB> itemList;
    itemList = snapshot.docs.map((element) {
      return ItemDB(
        description: element['description'],
        amount: element['amount'],
        category: element['category'],
        createdDateTime: element['createdDateTime'].toDate(),
      );
    }).toList();

    return itemList;
  }

  @override
  Future<String> addItem(Item value) async {
    DocumentReference ref =
        await FirebaseFirestore.instance.collection('final_app').add({
      'description': value.description,
      'amount': value.amount,
      'category': value.category,
      'createdDateTime': value.createdDateTime,
    });

    return ref.id;
  }
}
