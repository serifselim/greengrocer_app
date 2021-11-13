import 'package:flutter/material.dart';
import 'package:greengrocer_app/components/nav/nav_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        currentRoute: ModalRoute.of(context)?.settings.name,
      ),
      body: Container(
        child: Center(
          child: TextButton(onPressed: (){
            Navigator.pushNamed(context, '/basket');
          }, child: const Text('Go to basket')),
        ),
      ),
    );
  }
}