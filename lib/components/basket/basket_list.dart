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
      height: 400,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.basketList.length,
        itemBuilder: (BuildContext context, int index) {
          var basketItem = data.basketList[index];
          return BasketListItem(basketItem: basketItem);
        },
      ),
    );

  }
}

