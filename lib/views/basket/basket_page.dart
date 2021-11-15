// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:greengrocer_app/components/basket/basket_list.dart';
import 'package:greengrocer_app/components/nav/nav_bar.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/product_modal.dart';
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
            currentRoute: ModalRoute.of(context)?.settings.name,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 5,
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
                      BasketList(data: data),
                    ],
                  ),
                ),
              ),
              Expanded(
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
                          kTitleH2(context: context, title: '\$300')
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
              )
            ],
          ));
    });
  }
}
