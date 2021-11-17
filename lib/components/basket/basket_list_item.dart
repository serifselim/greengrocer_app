import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/style_constants.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/product_modal.dart';
import 'package:provider/provider.dart';

class BasketListItem extends StatefulWidget {
  final basketItem;

  const BasketListItem({
    Key? key,
    required this.basketItem,
  }) : super(key: key);

  @override
  State<BasketListItem> createState() => _BasketListItemState();
}

class _BasketListItemState extends State<BasketListItem> {
  bool isDeleteSide = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          isDeleteSide = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14.0),
        decoration: containerDecoration(radius: 15.0),
        child: !isDeleteSide
            ? Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    basketListItemLeftSide(context),
                    basketListItemRightSide(context)
                  ],
                ),
              )
            : deleteItemSide(context),
      ),
    );
  }

  Column basketListItemRightSide(BuildContext context) {
    void changeTotalCount(String process) {
      int currentTotal = int.parse(widget.basketItem["total"]);
      if (currentTotal > 1 || process != "-") {
        Provider.of<ProductModal>(context, listen: false).changeTotalCount(
          currentProduct: widget.basketItem,
          process: process,
        );
      }
    }

    return Column(
      children: [
        Container(
          height: 40.0,
          decoration: containerDecoration(radius: 25.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => changeTotalCount("-"),
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
              Text(widget.basketItem["total"]),
              IconButton(
                iconSize: 20.0,
                onPressed: () => changeTotalCount("+"),
                icon: const Icon(
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
              title: widget.basketItem["price"],
            )
          ],
        )
      ],
    );
  }

  Row basketListItemLeftSide(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50.0,
          child: kImage(widget.basketItem["image"]),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kTitleH2(context: context, title: widget.basketItem["name"]),
              kDecs(context: context, text: widget.basketItem["weight"])
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector deleteItemSide(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('deleted');
        Provider.of<ProductModal>(context, listen: false).deleteItemFromBasketList(widget.basketItem["name"]);
        setState(() {
          isDeleteSide = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: containerDecoration(radius: 15.0, color: Colors.red),
        child: const Center(
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
