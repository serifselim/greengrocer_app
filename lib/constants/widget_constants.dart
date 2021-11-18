import 'package:flutter/material.dart';

SizedBox kSpacer(double value) {
  return SizedBox(
    height: value,
  );
}

Image kImage(String asset) {
  return Image(
    image: AssetImage(asset),
  );
}


Container kDolarIcon({required BuildContext context, double size = 20.0}) {
  return Container(
    margin: const EdgeInsets.only(right: 3.0),
    child: Text(
      '\$',
      style: TextStyle(
        color: const Color(0xFF6FCF97),
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// Text Widgets
SizedBox kTitleH1({required BuildContext context, required String title}) {
  return SizedBox(
    width: 260.0,
    child: Text(
      title,
      style: Theme.of(context).textTheme.headline1,
    ),
  );
}

Text kTitleH2(
    {required BuildContext context,
    required String title,
    Color color = Colors.black}) {
  return Text(
    title,
    style: Theme.of(context).textTheme.headline2,
  );
}

Text kTitleH5({required BuildContext context, required String title}) {
  return Text(
    title,
    style: Theme.of(context).textTheme.headline5,
  );
}

Text kDecs({required BuildContext context, required String text}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.caption,
  );
}
