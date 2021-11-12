import 'package:flutter/material.dart';
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
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Column(
              children: <Widget>[
                Text('Everything in your door step'),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: data.products.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        child: Text(data.products[index]["name"]),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
