import 'package:blogdefi/presenter/scroll_special_home.dart';
import 'package:flutter/material.dart';

class DefiReview extends StatelessWidget {
  int categories;


  DefiReview({required this.categories});

  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: categories,);
  }
}
