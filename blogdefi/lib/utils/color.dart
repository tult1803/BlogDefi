import 'dart:ui';

import 'package:flutter/material.dart';

colorHexa(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

Color colorTap = Colors.white10;
Color colorSelectedIconBottomNavigationBar = colorHexa("000000");
Color colorUnSelectedIconBottomNavigationBar = Colors.black54;