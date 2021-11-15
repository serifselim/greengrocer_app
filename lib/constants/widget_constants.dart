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

SizedBox kTitleH1({required BuildContext context, required String title}) {
  return SizedBox(
    width: 260.0,
    child: Text(
      title,
      style: Theme.of(context).textTheme.headline1,
    ),
  );
}

Text kTitleH2({required BuildContext context, required String title}) {
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

Text kDecs({required BuildContext context, required String text}){
  return Text(
    text,
    style: Theme.of(context).textTheme.caption,
  );
}
