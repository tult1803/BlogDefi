import 'package:blogdefi/presenter/scroll_special_home.dart';
import 'package:flutter/material.dart';

class Blockchain extends StatelessWidget {
 int categories;


 Blockchain({required this.categories});

  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: categories,);
  }
}
