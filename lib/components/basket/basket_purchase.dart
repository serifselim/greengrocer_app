import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/provider_modal.dart';

class BasketPurchase extends StatelessWidget {
  ProductModal data;

  BasketPurchase({Key? key, required this.data}) : super(key: key);

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
            purchaseTotalPrice(context),
            purchaseButton(context)
          ],
        ),
      ),
    );
  }

  TextButton purchaseButton(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    var buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF6FCF97)),
    );

    return TextButton(
      onPressed: () {
        if (data.basketList.isNotEmpty) {
          orderCreatedDiolog(context).show();
          data.clearBasketList();
        }
      },
      child: const Text(
        'Purchase',
        style: textStyle,
      ),
      style: buttonStyle,
    );
  }

  AwesomeDialog orderCreatedDiolog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.TOPSLIDE,
      title: 'Order Has Been Created',
      desc: 'You paid ${data.totalPrice}\$ for this purchase ',
      btnOkText: 'Return to Home Page',
      btnOkIcon: Icons.home_outlined,
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    );
  }

  Row purchaseTotalPrice(BuildContext context) {
    String totalPrice = data.totalPrice.toStringAsFixed(2).toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        kTitleH2(context: context, title: 'Total'),
        Row(
          children: [
            kDolarIcon(context: context),
            kTitleH2(
              context: context,
              title: totalPrice,
            )
          ],
        )
      ],
    );
  }
}
