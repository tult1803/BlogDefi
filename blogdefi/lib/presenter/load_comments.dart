
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blogdefi/model/get/get_data_comments.dart';
import 'package:blogdefi/model/model_data_comment.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:blogdefi/utils/function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadComments extends StatefulWidget {
  int id;

  LoadComments({required this.id});

  @override
  _LoadCommentsState createState() => _LoadCommentsState();
}

class _LoadCommentsState extends State<LoadComments> {
  List<Comments>? dataComment;
  getComments() async {
    GetComments getComments = GetComments();
    dataComment = await getComments.getData("${widget.id}");

    return dataComment;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getComments(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (dataComment!.isNotEmpty) {
            return SizedBox(
              height: 400,
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: dataComment!.length,
                itemBuilder: (context, index) {
                  return containerComments(
                      size: size,
                      name: dataComment![index].authorName,
                      avata: dataComment![index].authorAvatarUrls!["48"],
                      comment: dataComment![index].content!.rendered!.substring(
                          3, dataComment![index].content!.rendered!.length - 5),
                      time: dataComment![index].date);
                },
              ),
            );
          } else {
            return Container(
              height: 150,
              child: const Center(child: Text("Không có bình luận"),),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget containerComments({size, name, avata, time, comment}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
              width: size.width,
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image(image: NetworkImage("$avata"))),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "$name",
                          maxLines: 1,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                              fontSize: 18, color: colorHexa("040507")),
                        ),
                        AutoSizeText(
                          "${getDateTime("$time")}",
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            width: size.width,
            margin: const EdgeInsets.only(left: 50),
            decoration: BoxDecoration(
              color: colorHexa("efefef"),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 6, right: 6, bottom: 11),
              child: Text("$comment",
                style: GoogleFonts.manrope(
                  fontSize: 13, color: colorHexa("000000")),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          SizedBox(
            height: 1.5,
            // width: 37,
            child: Container(
              color: colorHexa("e8e8e8"),
            ),
          ),
        ],
      ),
    );
  }
}
