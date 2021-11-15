// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                kTitleH1(
                  context: context,
                  title: 'Your Basket',
                ),
                ListView.builder(
                  itemCount: data.basket.length,
                  itemBuilder: (BuildContext context, int index) {
                    var product = data.basket[index];
                    return Container(
                      child: Text(product["name"]),
                    );
                  },
                )
              ],
            ),
          ));
    });
  }
}
