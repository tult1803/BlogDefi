import 'package:blogdefi/helpers/container.dart';
import 'package:blogdefi/view/home/mini/latest_new.dart';
import 'package:blogdefi/view/home/mini/new_today.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          containerTitle(context,"News Today", categories: 37),
          const SizedBox(height: 10,),
          NewsToday(categories: 37,),
          const SizedBox(height: 10,),
          containerTitle(context,"Education", categories: 3),
          const SizedBox(height: 10,),
          LatestNews(categories: 3,),
          const SizedBox(height: 100,),
        ],
      ),
    );
  }
}
