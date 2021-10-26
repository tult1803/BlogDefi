import 'package:blogdefi/presenter/scroll_special_home.dart';
import 'package:flutter/material.dart';

class DefiNew extends StatelessWidget {
  int categories;


  DefiNew({required this.categories});

  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: categories,);
  }
}
