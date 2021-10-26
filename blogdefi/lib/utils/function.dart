import 'package:blogdefi/model/model_data_categories_blog.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';

List<CategoriesBlog>? dataNewsToday;
List<CategoriesBlog>? dataLatestNews;
//Share bài viết
shareBlog({mainUrl, title, redirectUrl}) async {
  await FlutterShare.share(
    title: mainUrl,
    text: title,
    linkUrl: redirectUrl,
  );
}


getDateTime(String date){
  DateTime dateF = DateTime.parse(date);
  return DateFormat('MM:HH dd/MM').format(dateF);
}