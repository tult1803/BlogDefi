import 'package:blogdefi/presenter/scroll_special_home.dart';
import 'package:flutter/material.dart';

class DefiNFTS extends StatelessWidget {
  int categories;


  DefiNFTS({required this.categories});

  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: categories,);
  }
}
