import 'package:blogdefi/data_demo.dart';
import 'package:blogdefi/helpers/container.dart';
import 'package:blogdefi/helpers/load/loading_animation.dart';
import 'package:blogdefi/model/get/get_blog_categories.dart';
import 'package:blogdefi/utils/function.dart';
import 'package:flutter/material.dart';

class LatestNews extends StatefulWidget {
  int categories;

  LatestNews({required this.categories});

  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  getData() async {
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    if (dataLatestNews == null) {
      dataLatestNews = await categoriesBlog.getData(
          categories: "${widget.categories}", page: "1", perPage: "4");
    }
    return dataLatestNews;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              containerDetailBlog(context,
                  imgUrl: "${dataLatestNews![0].yoastHeadJson!.ogImage!.first.url}",
                  size: size,
                  id: dataLatestNews![0].id,
                  content: "${dataLatestNews![0].content!.rendered}",
                  redirectUrl: "${dataLatestNews![0].guid!.rendered}",
                  title: "${dataLatestNews![0].title!.rendered}",),
              containerDetailBlog(context,
                imgUrl: "${dataLatestNews![1].yoastHeadJson!.ogImage!.first.url}",
                size: size,
                id: dataLatestNews![1].id,
                content: "${dataLatestNews![1].content!.rendered}",
                redirectUrl: "${dataLatestNews![1].guid!.rendered}",
                title: "${dataLatestNews![1].title!.rendered}",),
              containerDetailBlog(context,
                imgUrl: "${dataLatestNews![2].yoastHeadJson!.ogImage!.first.url}",
                size: size,
                id: dataLatestNews![2].id,
                content: "${dataLatestNews![2].content!.rendered}",
                redirectUrl: "${dataLatestNews![2].guid!.rendered}",
                title: "${dataLatestNews![2].title!.rendered}",),
              containerDetailBlog(context,
                imgUrl: "${dataLatestNews![3].yoastHeadJson!.ogImage!.first.url}",
                size: size,
                id: dataLatestNews![3].id,
                content: "${dataLatestNews![3].content!.rendered}",
                redirectUrl: "${dataLatestNews![3].guid!.rendered}",
                title: "${dataLatestNews![3].title!.rendered}",),
            ],
          );
        }
        return SizedBox(
            height: 200,
            width: size.width,
            child: ColorLoader(
              dotRadius: 6,
              radius: 20,
            ));
      },
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         containerDetailBlog(context,
//             imgUrl: "$url",
//         size: size,
//         title: "How to tighten the speed when racing"),
//         containerDetailBlog(context,
//             imgUrl: "$url",
//             size: size,
//             title: "How to tighten the speed when racing"),
//         containerDetailBlog(context,
//             imgUrl: "$url",
//             size: size,
//             title: "How to tighten the speed when racing"),
//       ],
//     );
//   }
// }
