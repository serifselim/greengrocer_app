import 'package:flutter/material.dart';
import 'package:greengrocer_app/provider/product_modal.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModal>(
      builder: (context, product, child) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            
          ),

        );
      },
    );

    // return Scaffold(
    //   appBar: AppBar(),
    //   body: FutureBuilder(
    //       initialData: Provi,
    //     ),
    // );
  }
}
