// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:greengrocer_app/components/basket/basket_list.dart';
import 'package:greengrocer_app/components/basket/basket_purchase.dart';
import 'package:greengrocer_app/components/nav/nav_bar.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/provider_modal.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModal>(builder: (context, data, child) {
      return Scaffold(
          appBar: NavBar(
            basketCount: data.basketList.length,
            currentRoute: ModalRoute.of(context)?.settings.name,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      kTitleH1(
                        context: context,
                        title: 'Your Basket',
                      ),
                      kSpacer(33.0),
                      BasketList(
                        data: data,
                      ),
                    ],
                  ),
                ),
              ),
              BasketPurchase(
                data: data,
              )
            ],
          ));
    });
  }
}
