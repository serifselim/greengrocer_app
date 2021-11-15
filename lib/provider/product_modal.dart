import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProductModal extends ChangeNotifier{
  List<dynamic> products = [];
  List<dynamic> basket = [];

  Future<void> getProductsFromJson() async {
    final String response = await rootBundle.loadString('assets/data/items.json');
    final data = await jsonDecode(response);
    products = data["products"];
    notifyListeners();
  }


}