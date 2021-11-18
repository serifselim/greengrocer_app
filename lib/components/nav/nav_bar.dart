// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  final dynamic currentRoute;
  final int basketCount;

  const NavBar({
    required this.currentRoute,
    required this.basketCount,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: currentRoute != '/' ? backButton(context) : null,
      actions: currentRoute != '/basket' ? [basketButton(context)] : null,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.0,
    );
  }

  Container basketButton(BuildContext context) {
    final String basketCountText = basketCount.toString();

    return Container(
        margin: const EdgeInsets.only(right: 30.0),
        child: Row(
          children: <Widget>[
            basketCount > 0 ? Container(
              alignment: Alignment.center,
              width: 22.0,
              height: 22.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF6FCF97)),
              child: Text(
                basketCountText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) : Container(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basket');
              },
              icon: Icon(
                Icons.shopping_basket_outlined,
                color: basketCount > 0 ? const Color(0xFF6FCF97) : Colors.black,
                size: 32.0,
              ),
            ),
          ],
        ));
  }

  Container backButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
        ),
      ),
    );
  }
}
