import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/style_constants.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';

class BasketListItem extends StatelessWidget {
  final product;

  const BasketListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: containerDecoration(radius: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          basketListItemLeftSide(context),
          basketListItemRightSide(context)
        ],
      ),
    );
  }

  Column basketListItemRightSide(BuildContext context) {
    return Column(
          children: [
            Container(
              decoration: containerDecoration(radius: 25.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                  Text(product["total"]),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            kSpacer(10.0),
            Row(
              children: [
                kTitleH5(
                  context: context,
                  title: "\$",
                ),
                kTitleH5(
                  context: context,
                  title: product["price"],
                )
              ],
            )
          ],
        );
  }

  Row basketListItemLeftSide(BuildContext context) {
    return Row(
          children: [
            kImage(product["image"]),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kTitleH2(
                      context: context,
                      title: product["name"]),
                  kDecs(
                      context: context,
                      text: product["weight"])
                ],
              ),
            ),
          ],
        );
  }
}