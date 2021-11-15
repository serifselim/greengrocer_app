import 'package:flutter/material.dart';
import 'package:greengrocer_app/provider/product_modal.dart';
import 'basket_list_item.dart';

class BasketList extends StatelessWidget {
  ProductModal data;
  
  BasketList({
    Key? key,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: data.basketList.length,
        itemBuilder: (BuildContext context, int index) {
          var product = data.basketList[index];
          return BasketListItem(product: product);
        },
      ),
    );

  }
}

