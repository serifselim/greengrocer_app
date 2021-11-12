import 'package:flutter/material.dart';
import 'package:greengrocer_app/provider/product_modal.dart';
import 'package:greengrocer_app/views/basket/basket_page.dart';
import 'package:greengrocer_app/views/detail/detail_page.dart';
import 'package:greengrocer_app/views/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductModal(),
      child: GreenGrocerApp(),
    ),
  );
}

class GreenGrocerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(context),
        '/detail' : (context) => DetailPage(),
        '/basket' : (context) => BasketPage()
      },
    );
  }
}
