import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProductModal extends ChangeNotifier {
  List<dynamic> productsList = [];
  List<dynamic> basketList = [];
  double totalPrice = 0;

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
      totalPrice = getTotalPrice();
    } else {
      for (var basketItem in basketList) {
        if (basketItem["name"] == product["name"]) {
          isThere = true;
          int indexOf = basketList.indexOf(basketItem);
          changeTotalCount(indexOf, "+");
          // basketList[indexOf]["total"] =
          //     (int.parse(basketList[indexOf]["total"]) + 1).toString();
          // totalPrice = getTotalPrice();
        }
      }
      if (!isThere) {
        basketList.add(product);
        totalPrice = getTotalPrice();
      } else {
        print('there is!');
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    if (basketList.length > 1) {
      for (var basketItem in basketList) {
        double itemPrice = double.parse(basketItem["price"]);
        double itemTotal = double.parse(basketItem["total"]);

        totalPrice += itemPrice * itemTotal;
      }
      return totalPrice;
    } else {
      return totalPrice;
    }
  }

  void changeTotalCount(int indexOf, String process) {
    int beforeTotal = int.parse(basketList[indexOf]["total"]);
    if (beforeTotal > 0) {
      basketList[indexOf]["total"] = process == "+"
          ? (beforeTotal + 1).toString()
          : (beforeTotal - 1).toString();
      totalPrice = getTotalPrice();
    }
    notifyListeners();
  }
}
