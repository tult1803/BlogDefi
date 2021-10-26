import 'package:blogdefi/presenter/scroll_special_home.dart';
import 'package:flutter/material.dart';

class DefiProject extends StatelessWidget {
  int categories;


  DefiProject({required this.categories});

  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: categories,);
  }
}
