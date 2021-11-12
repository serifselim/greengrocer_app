import 'package:flutter/material.dart';
import 'package:greengrocer_app/components/nav/nav_bar.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Container(
        child: Center(
          child: TextButton(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, child: const Text('Go to home')),
        ),
      ),
    );
  }
}