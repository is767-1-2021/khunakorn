import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  String? _dealName;
  String? _productName;
  int? _price;


  get dealName => this._dealName;

  set dealName( value) {
    this._dealName = value;
    notifyListeners();
  }



  get productName => this._productName;

  set productName( value) {
    this._productName = value;
    notifyListeners();
  }



  get price => this._price;

  set price( value) {
    this._price = value;
    notifyListeners();
  }

}