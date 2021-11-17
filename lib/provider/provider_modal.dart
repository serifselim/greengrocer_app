import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:greengrocer_app/provider/product.dart';

class ProductModal extends ChangeNotifier {
  List<Product> productsList = [];
  List<dynamic> basketList = [];
  double totalPrice = 0;

  Future<void> getProductsFromJson() async {
    const String assetURL = 'assets/data/items.json';
    List<dynamic> productsData = await convertJsonFile(assetURL);

    for (var product in productsData) {
      final newProduct = setProductToList(product);
      productsList.add(newProduct);
    }

    notifyListeners();
  }

  Product setProductToList(dynamic product) {
    final productData = Product(
      name: product["name"],
      price: double.parse(product["price"]),
      total: 1,
      weight: product["weight"],
      imageFilePath: product["imageFilePath"],
      isDeletable: false,
    );

    return productData;
  }

  Future<List<dynamic>> convertJsonFile(String assetURL) async {
    final String response = await rootBundle.loadString(assetURL);
    final data = await jsonDecode(response);
    final products = data["products"];

    return products;
  }

  void addToBasketFromProducts(Product currentProduct) {
    bool isThere = false;

    if (basketList.isEmpty) {
      basketList.add(currentProduct);
      totalPrice = getTotalPrice();
    } else {
      for (var basketItem in basketList) {
        if (basketItem.name == currentProduct.name) {
          isThere = true;
          changeTotalCount(currentProduct: basketItem, process: "+");
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
      for (Product basketItem in basketList) {
        double itemPrice = basketItem.price;
        int itemTotal = basketItem.total;

        totalPrice += itemPrice * itemTotal;
      }
      return totalPrice;
    } else {
      return totalPrice;
    }
  }

  void changeTotalCount(
      {required Product currentProduct, required String process}) {
    int indexOf = basketList.indexOf(currentProduct);
    int beforeTotal = basketList[indexOf].total;

    if (beforeTotal > 0) {
      basketList[indexOf].total =
          process == "+" ? beforeTotal + 1 : beforeTotal - 1;

      totalPrice = getTotalPrice();
    }

    notifyListeners();
  }

  void deleteProductFromBasketList(Product product) {
    basketList.remove(product);
    totalPrice = getTotalPrice();
    notifyListeners();
  }
}
