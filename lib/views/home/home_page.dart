// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:greengrocer_app/components/nav/nav_bar.dart';
import 'package:greengrocer_app/provider/product_modal.dart';
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
    return Consumer<ProductModal>(
      builder: (context, data, child) {
        var products = data.products;
        return Scaffold(
          appBar: NavBar(
            currentRoute: ModalRoute.of(context)?.settings.name,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    productsTitle(context),
                    spacer(33.0),
                    bannerImage(),
                    spacer(33.0),
                    ProductsList(
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

  SizedBox productsTitle(BuildContext context) {
    return SizedBox(
      width: 260.0,
      child: Text(
        'Everything in your door step',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  SizedBox spacer(double value) {
    return SizedBox(
      height: value,
    );
  }

  Image bannerImage() {
    return const Image(
      image: AssetImage('assets/images/banner.png'),
    );
  }
}

class ProductsList extends StatelessWidget {
  final ProductModal data;

  const ProductsList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          var product = data.products[index];
          return Card(
            child: GridTile(child: Text('test$index')),
          );
        },
      ),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<ProductModal>('data', data));
  // }
}

                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 2,
                //   child: ListView.builder(
                //     itemCount: data.products.length,
                //     itemBuilder: (BuildContext context, int index){
                //       var product = products[index];
                //       return ListTile(
                //         title: Text(product["name"]),
                //       );
                //     },
                //   ),
                // )
