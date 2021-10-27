import 'package:blogdefi/helpers/container.dart';
import 'package:blogdefi/helpers/load/loading_animation.dart';
import 'package:blogdefi/model/get/get_blog_categories.dart';
import 'package:blogdefi/utils/function.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsToday extends StatefulWidget {
  int categories;


  NewsToday({required this.categories});

  @override
  _NewsTodayState createState() => _NewsTodayState();
}

class _NewsTodayState extends State<NewsToday> {

  getData() async {
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    if(dataNewsToday == null) {
      dataNewsToday = await categoriesBlog.getData(
          categories: "${widget.categories}", page: "1", perPage: "5");
    }
    return dataNewsToday;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return SizedBox(
            height: 250,
            width: size.width,
            child: CarouselSlider.builder(
              itemCount: dataNewsToday!.length,
              itemBuilder: (context, index, realIndex) {
                return slideWeight(
                    context: context,
                    title: "${dataNewsToday![index].title!.rendered}",
                    contentDetail: "${dataNewsToday![index].content!.rendered}",
                    id: dataNewsToday![index].id,
                    redirectUrl: dataNewsToday![index].guid!.rendered,
                    imgUrl: "${dataNewsToday![index].yoastHeadJson!.ogImage!.first.url}");
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
        return SizedBox(height: 200,
          width: size.width,child: ColorLoader(dotRadius: 6,radius: 20,));
      },
    );
  }
}
