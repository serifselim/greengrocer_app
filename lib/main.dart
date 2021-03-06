import 'package:flutter/material.dart';
import 'package:greengrocer_app/provider/provider_modal.dart';
import 'package:greengrocer_app/views/basket/basket_page.dart';
import 'package:greengrocer_app/views/home/home_page.dart';
import 'package:provider/provider.dart';

import 'constants/theme_constants.dart';

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
      theme: kTheme(),
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(context),
        '/basket': (context) => const BasketPage()
      },
    );
  }
}
