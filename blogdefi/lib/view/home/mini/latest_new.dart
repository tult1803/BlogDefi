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
    dataLatestNews ??= await categoriesBlog.getData(
          categories: "${widget.categories}", page: "1", perPage: "4");
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
                  size: size,
                  title: "${dataNewsToday!.elementAt(0)['title']['rendered']}",
                  content:
                      "${dataNewsToday!.elementAt(0)['content']['rendered']}",
                  id: dataNewsToday!.elementAt(0)['id'],
                  redirectUrl: dataNewsToday!.elementAt(0)['guid']['rendered'],
                  imgUrl:
                      "${dataNewsToday!.elementAt(0)['yoast_head_json']["og_image"].first['url']}"),
              containerDetailBlog(context,
                  size: size,
                  title: "${dataNewsToday!.elementAt(1)['title']['rendered']}",
                  content: "${dataNewsToday!.elementAt(1)['content']['rendered']}",
                  id: dataNewsToday!.elementAt(1)['id'],
                  redirectUrl: dataNewsToday!.elementAt(1)['guid']['rendered'],
                  imgUrl: "${dataNewsToday!.elementAt(1)['yoast_head_json']["og_image"].first['url']}"),
              containerDetailBlog(context,
                  size: size,
                  title: "${dataNewsToday!.elementAt(2)['title']['rendered']}",
                  content: "${dataNewsToday!.elementAt(2)['content']['rendered']}",
                  id: dataNewsToday!.elementAt(2)['id'],
                  redirectUrl: dataNewsToday!.elementAt(2)['guid']['rendered'],
                  imgUrl: "${dataNewsToday!.elementAt(2)['yoast_head_json']["og_image"].first['url']}"),
              containerDetailBlog(context,
                  size: size,
                  title: "${dataNewsToday!.elementAt(3)['title']['rendered']}",
                  content: "${dataNewsToday!.elementAt(3)['content']['rendered']}",
                  id: dataNewsToday!.elementAt(3)['id'],
                  redirectUrl: dataNewsToday!.elementAt(3)['guid']['rendered'],
                  imgUrl: "${dataNewsToday!.elementAt(3)['yoast_head_json']["og_image"].first['url']}"),
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
