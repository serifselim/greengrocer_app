import 'package:flutter/material.dart';
import 'package:path/path.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  final dynamic currentRoute;

  const NavBar({
    required this.currentRoute,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: currentRoute != '/'
          ? Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                ),
              ),
            )
          : null,
      actions: currentRoute != '/basket' ? [
        Container(
          margin: const EdgeInsets.only(right: 30.0),
          child: IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.shopping_basket_outlined,
              color: Colors.black,
              size: 32.0,
            ),
          ),
        )
      ] : null,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.0,
    );
  }
}
