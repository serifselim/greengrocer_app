import 'package:flutter/material.dart';
import 'package:greengrocer_app/provider/product_modal.dart';

class HomeProductsList extends StatelessWidget {
  final ProductModal data;

  const HomeProductsList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 30.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          var product = data.products[index];
          return Card(
            child: GridTile(child: Text('test$index')),
          );
        },
      ),
    );
  }
}