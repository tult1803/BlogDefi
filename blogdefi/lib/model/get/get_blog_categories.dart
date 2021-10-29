import 'dart:convert';

import 'package:blogdefi/utils/url.dart';
import 'package:http/http.dart' as http;
import '../model_data_categories_blog.dart';

class GetCategoriesBlogSearch {
  getData({required search, required page, required perPage}) async {
    try {
      var response = await http.get(
          Uri.https(urlDefiaz, subUrl, {
            "page": "$page",
            "per_page": "$perPage",
            "search": "$search",
          }),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          });
      print('Get API Search Posts: ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    }catch(e){
      print(e);
    }
  }
}

class GetCategoriesBlog {
  getData({required categories, required page, required perPage}) async {
    try {
      var response = await http.get(
          Uri.https(urlDefiaz, subUrl, {
            "categories": "$categories",
            "page": "$page",
            "per_page": "$perPage",
          }),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          });

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    }catch(e){
      print(e);
    }
  }
}