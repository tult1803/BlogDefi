import 'package:blogdefi/data_demo.dart';
import 'package:blogdefi/helpers/container.dart';
import 'package:flutter/material.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        containerHotNews(context,
            imgUrl: "$url",
        size: size,
        title: "How to tighten the speed when racing"),
        containerHotNews(context,
            imgUrl: "$url",
            size: size,
            title: "How to tighten the speed when racing"),
        containerHotNews(context,
            imgUrl: "$url",
            size: size,
            title: "How to tighten the speed when racing"),
      ],
    );
  }
}
