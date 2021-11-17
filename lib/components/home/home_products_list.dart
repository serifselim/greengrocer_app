import 'package:flutter/material.dart';
import 'package:greengrocer_app/provider/product.dart';
import 'package:greengrocer_app/provider/provider_modal.dart';
import 'home_products_list_item.dart';

class HomeProductsList extends StatelessWidget {
  final ProductModal data;

  const HomeProductsList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Grid Settings
    const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20.0,
      childAspectRatio: 1 / 1.7,
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.2,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.productsList.length,
        gridDelegate: gridDelegate,
        itemBuilder: (BuildContext context, int index) {
          Product product = data.productsList[index];
          return HomeProductsListItem(
            product: product,
            onPressed: () => data.addToBasketFromProducts(product),
          );
        },
      ),
    );
  }
}
