import 'package:flutter/material.dart';

BoxDecoration containerDecoration({required double radius}) {
  return BoxDecoration(
    border: Border.all(color: const Color(0xE5E5E5E5)),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

BoxDecoration buttonDecoration() {
  return const BoxDecoration(
    color: Color(0xFF6FCF97),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
}
