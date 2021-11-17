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

  void addToBasketFromProducts(dynamic currentProduct) {
    bool isThere = false;

    if (basketList.isEmpty) {
      basketList.add(currentProduct);
      totalPrice = getTotalPrice();
    } else {
      for (var basketItem in basketList) {
        if (basketItem["name"] == currentProduct["name"]) {
          isThere = true;
          changeTotalCount(
            currentProduct: basketItem,
            process: "+"
          );
        }
      }
      if (!isThere) {
        basketList.add(currentProduct);
        totalPrice = getTotalPrice();
      } else {
        print('there is!');
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    if (basketList.isNotEmpty) {
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

  void changeTotalCount({required dynamic currentProduct, required String process}) {
    int indexOf = basketList.indexOf(currentProduct);
    int beforeTotal = int.parse(basketList[indexOf]["total"]);

    if (beforeTotal > 0) {
      basketList[indexOf]["total"] = process == "+"
          ? (beforeTotal + 1).toString()
          : (beforeTotal - 1).toString();
      totalPrice = getTotalPrice();
    }
    notifyListeners();
  }

  void deleteItemFromBasketList(String productName){
    basketList.removeWhere((item) => item["name"] == productName);
    totalPrice = getTotalPrice();
    notifyListeners();
  }
}

