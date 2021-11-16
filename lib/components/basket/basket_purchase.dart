import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/product_modal.dart';

class BasketPurchase extends StatelessWidget {
  ProductModal data;

  BasketPurchase({
    Key? key,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kTitleH2(context: context, title: 'Total'),
                kTitleH2(context: context, title: '\$${data.totalPrice}')
              ],
            ),
            TextButton(
              onPressed: null,
              child: const Text(
                'Purchase',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF6FCF97)),
              ),
            )
          ],
        ),
      ),
    );
  }
}