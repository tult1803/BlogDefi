import 'dart:ui';

import 'package:flutter/material.dart';

colorHexa(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

Color colorAppBar = Colors.white;
Color colorIconAppBar = Colors.blueAccent;
Color colorTap = Colors.white10;
Color colorSelectedIconBottomNavigationBar = colorHexa("000000");
Color colorUnSelectedIconBottomNavigationBar = Colors.black54;

Color labelColor = Colors.black87;
Color colorComponentTab = colorHexa("ededed");

Color colorContainerTitle = colorHexa("1d1f21");
