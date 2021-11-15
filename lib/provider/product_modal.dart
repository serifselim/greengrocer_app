import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProductModal extends ChangeNotifier {
  List<dynamic> productsList = [];
  List<dynamic> basketList = [];

  Future<void> getProductsFromJson() async {
    final String response =
        await rootBundle.loadString('assets/data/items.json');
    final data = await jsonDecode(response);
    productsList = data["products"];
    notifyListeners();
  }

  void addToBasketFromProducts(dynamic product) {
    bool isThere = false;

    if (basketList.isEmpty) {
      basketList.add(product);
    } else {
      for (var basketItem in basketList) {
        if(basketItem["name"] == product["name"]){
          isThere = true;
        }
      }
      if (!isThere) {
        basketList.add(product);
      } else{
        print('there is!');
      }
    }
    notifyListeners();
  }
}
