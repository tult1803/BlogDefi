import 'package:blogdefi/data_demo.dart';
import 'package:blogdefi/helpers/container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsToday extends StatefulWidget {
  const NewsToday({Key? key}) : super(key: key);

  @override
  _NewsTodayState createState() => _NewsTodayState();
}

class _NewsTodayState extends State<NewsToday> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 250,
      width: size.width,
      child: CarouselSlider.builder(
        itemCount: 4,
        itemBuilder: (context, index, realIndex) {
          return slideWeight(
              context: context,
              title: "News of marathon matches during this pandemic",
              contentDetail: "",
              id: "",
              imgUrl: "$url");
        },
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 3),
          viewportFraction: 0.8,
          aspectRatio: 1.6,
          initialPage: 0,
        ),
      ),
    );
  }
}
