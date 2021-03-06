import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/style_constants.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/product.dart';

class HomeProductsListItem extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;
  const HomeProductsListItem(
      {Key? key, required this.product, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration(radius: 19.0),
      padding: const EdgeInsets.only(top: 13.0, left: 13.0, right: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          productImage(),
          productTitle(context),
          productDescription(context),
          productDetails(context)
        ],
      ),
    );
  }

  Text productTitle(BuildContext context) {
    return kTitleH2(
      context: context,
      title: product.name,
    );
  }

  Text productDescription(BuildContext context) {
    return kDecs(
      context: context,
      text: product.weight,
    );
  }

  Container productDetails(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              kDolarIcon(context: context),
              kTitleH2(
                context: context,
                title: product.price.toString(),
              ),
            ],
          ),
          addProductButton()
        ],
      ),
    );
  }

  Container addProductButton() {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: buttonDecoration(),
      child: IconButton(
        iconSize: 20.0,
        onPressed: onPressed,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Container productImage() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 8.0, bottom: 15.0),
      child: kImage(
        product.imageFilePath,
      ),
    );
  }

  // Style Side

}
