import 'package:flutter/material.dart';


class NavBar extends StatelessWidget with PreferredSizeWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Icon(
          Icons.arrow_back_ios_rounded,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 30.0),
          child: IconButton(onPressed: null, icon: Icon(Icons.shopping_basket_outlined, color: Colors.black, size: 32.0,)),
        )
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.0,
    );
  }
}