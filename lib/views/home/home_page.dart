// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:greengrocer_app/components/home/home_products_list.dart';
import 'package:greengrocer_app/components/nav/nav_bar.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/provider_modal.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  BuildContext context;

  HomePage(this.context, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    await Provider.of<ProductModal>(widget.context).getProductsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    final String? routeName = ModalRoute.of(context)?.settings.name;

    return Consumer<ProductModal>(
      builder: (context, data, child) {
        var products = data.productsList;
        return Scaffold(
          appBar: NavBar(
            basketCount : data.basketList.length,
            currentRoute: routeName,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    kTitleH1(
                      context: context,
                      title: 'Everything in your door step',
                    ),
                    bannerImage(),
                    HomeProductsList(
                      data: data,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container bannerImage() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 33.0),
      child: kImage('assets/images/banner.png'),
    );
  }
}
