import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';

class HomeProductsListItem extends StatelessWidget {
  final dynamic product;
  final VoidCallback onPressed;
  const HomeProductsListItem(
      {Key? key, required this.product, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration(),
      padding: const EdgeInsets.only(top: 13.0, left: 13.0, right: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 8.0, bottom: 15.0),
            child: kImage(
              product["image"],
            ),
          ),
          kTitleH2(
            context: context,
            title: product["name"],
          ),
          kDecs(
            context: context,
            text: product["weight"],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                kTitleH2(
                  context: context,
                  title: product["price"],
                ),
                Container(
                  decoration: buttonDecoration(),
                  child: IconButton(
                    iconSize: 30.0,
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Style Side
  BoxDecoration buttonDecoration() {
    return const BoxDecoration(
      color: Color(0xFF6FCF97),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      border: Border.all(color: const Color(0xE5E5E5E5)),
      borderRadius: const BorderRadius.all(Radius.circular(19.0)),
    );
  }
}
