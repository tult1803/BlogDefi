
import 'package:blogdefi/utils/url.dart';
import 'package:http/http.dart' as http;
import '../model_data_comment.dart';

class GetComments {
  getData(post) async {
      var response = await http.get(
          Uri.https(urlDefiaz, urlLoadComment,{"post": "$post"}),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          });
      print('Get Comments: ${response.statusCode}');
      if (response.statusCode == 200) {
        if(response.body.isNotEmpty){
          return commentsFromJson(response.body);
        }
        else {
          return [];
        }
      } else {
        return [];
      }
  }
}

