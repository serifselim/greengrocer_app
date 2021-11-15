import 'package:flutter/material.dart';
import 'package:greengrocer_app/constants/widget_constants.dart';
import 'package:greengrocer_app/provider/product_modal.dart';

class HomeProductsList extends StatelessWidget {
  final ProductModal data;

  const HomeProductsList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 30.0,
            childAspectRatio: 1 / 1.50),
        itemBuilder: (BuildContext context, int index) {
          var product = data.products[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xE5E5E5E5)),
              borderRadius: const BorderRadius.all(Radius.circular(19.0))
            ),
            padding: const EdgeInsets.only(top: 13.0, left: 13.0, right: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                kSpacer(8.0),
                Center(child: kImage(product["image"])),
                kSpacer(15.0),
                kTitleH2(
                  context: context,
                  title: product["name"],
                ),
                kDecs(
                  context: context,
                  text: product["weight"],
                ),
                kSpacer(7.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    kTitleH2(
                      context: context,
                      title: product["price"],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF6FCF97),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: const IconButton(
                        iconSize: 30.0,
                        onPressed: null,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
