import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/style_constants.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/product.dart';
import 'package:greengrocer_app/provider/provider_modal.dart';
import 'package:provider/provider.dart';

class BasketListItem extends StatefulWidget {
  final Product product;

  const BasketListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<BasketListItem> createState() => _BasketListItemState();
}

class _BasketListItemState extends State<BasketListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          widget.product.changeIsDeletable();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14.0),
        decoration: containerDecoration(
            radius: 15.0,
            color: widget.product.isDeletable ? Colors.red : Colors.white),
        child: !widget.product.isDeletable
            ? basketItemSide(context)
            : deleteItemSide(context),
      ),
    );
  }

  Container basketItemSide(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
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
    void changeTotalCount(String process) {
      int currentTotal = widget.product.total;
      if (currentTotal > 1 || process != "-") {
        Provider.of<ProductModal>(context, listen: false).changeTotalCount(
          currentProduct: widget.product,
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
              Text(widget.product.total.toString()),
              IconButton(
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
            kDolarIcon(
              context: context,
              size: 15.0
            ),
            kTitleH5(
              context: context,
              title: widget.product.price.toString(),
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
          child: kImage(
            widget.product.imageFilePath,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kTitleH2(context: context, title: widget.product.name),
              kDecs(context: context, text: widget.product.weight)
            ],
          ),
        ),
      ],
    );
  }

  TextButton deleteItemSide(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<ProductModal>(context, listen: false)
            .deleteProductFromBasketList(widget.product);
      },
      child: const Icon(
        Icons.delete_forever,
        color: Colors.white,
        size: 35.0,
      ),
    );
  }
}
