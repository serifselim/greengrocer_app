import 'package:awesome_dialog/awesome_dialog.dart';
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
    const SliverGridDelegate _gridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20.0,
      childAspectRatio: 1 / 1.7,
    );

    double _height = MediaQuery.of(context).size.height * 1.2;

    return SizedBox(
      height: _height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.productsList.length,
        gridDelegate: _gridDelegate,
        itemBuilder: (BuildContext context, int index) {
          Product product = data.productsList[index];
          return HomeProductsListItem(
              product: product,
              onPressed: () {
                data.addToBasketFromProducts(product);
                addedItemDialog(context, product).show();
              });
        },
      ),
    );
  }

  AwesomeDialog addedItemDialog(BuildContext context, Product product) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.TOPSLIDE,
      title: '${product.name} Added',
      btnCancelColor: Colors.yellow[800],
      btnCancelIcon: Icons.shopping_basket_outlined,
      btnCancelText: 'Basket',
      btnOkText: 'Ok',
      btnOkIcon: Icons.account_balance_wallet_outlined,
      btnCancelOnPress: () {
        Navigator.pushNamed(context, '/basket');
      },
      btnOkOnPress: () {},
    );
  }
}
