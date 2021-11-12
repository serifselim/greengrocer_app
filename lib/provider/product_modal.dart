import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProductModal extends ChangeNotifier{
  List<String> _products = [];

  List<dynamic> getProducts(){
    return _products;
  }

  Future<List> setProductsFromJson() async {
    final String response = await rootBundle.loadString('assets/data/items.json');
    final data = await jsonDecode(response);
    _products = data["products"];
    return _products;
  }
}