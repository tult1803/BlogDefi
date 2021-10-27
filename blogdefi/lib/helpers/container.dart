// Dùng cho title của các container trong trang chủ
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blogdefi/helpers/components.dart';
import 'package:blogdefi/icon_defi_blog/icon_blog_defi_icons.dart';
import 'package:blogdefi/presenter/scroll_special_home.dart';
import 'package:blogdefi/presenter/show_detail_blog.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Chữ trong container
Widget containerText(title,
    {required int maxLines,
    required double fontSize,
    required double heightContainer}) {
  return Container(
    height: heightContainer,
    child: AutoSizeText(
      "$title",
      style: GoogleFonts.manrope(
          color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
      maxFontSize: fontSize,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    ),
  );
}

//Slider thiên về chiều dài

Widget slideWeight(
    {required BuildContext context,
    id,
    imgUrl,
    title,
    contentDetail,
    redirectUrl}) {
  return GestureDetector(
    onTap: () {
      String htmlData = "<body>$contentDetail</body>";
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailBlog(
          id: id,
          htmlData: htmlData,
          title: "$title",
          mainUrl: imgUrl,
          redirectUrl: redirectUrl,
        ),
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: containerText("${title ?? ""}",
                      heightContainer: 55, fontSize: 17, maxLines: 2),
                ),
              )),
        ],
      ),
    ),
  );
}

Widget containerTitle(BuildContext context,title, {bool? isShowIcon,double? widthSizeBox, double? fontSize, Widget? widget, int? categories}) {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    width: double.infinity,
    child: Row(
      children: [
        Expanded(
          child: Text(
            "$title",
            style: GoogleFonts.sora(
                color: colorContainerTitle,
                fontWeight: FontWeight.w500,
                fontSize: fontSize ?? 20),
          ),
        ),
        SizedBox(
          child:isShowIcon == false ? Container() : Container(
              margin: const EdgeInsets.only(right: 20),
              child:  GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          backgroundColor: colorAppBar,
                          leading: leadingAppbar(context, colorIcon: colorIconAppBar),
                        ),
                        body: scrollSpecialHome(categories: categories,)),
                    ));
                  },
                  child: Icon(IconBlogDefi.dot))),
        ),
      ],
    ),
  );
}

//Dùng cho tin hot trong tuần của trang chủ
Widget containerDetailBlog(
  context, {
  size,
  id,
  imgUrl,
  title,
  content,
  redirectUrl,
}) {
  return GestureDetector(
    onTap: () {
      String htmlData = "<body>$content</body>";
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailBlog(
          id: id,
          htmlData: htmlData,
          title: "$title",
          mainUrl: imgUrl,
          redirectUrl: redirectUrl,
        ),
      ));
    },
    child: Container(
      margin: const EdgeInsets.only(top: 10,left: 20, right: 20, bottom: 10),
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imgUrl,
                width: 99,
                height: 99,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AutoSizeText(
                      "$title",
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          color: colorHexa("1d1f21"),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 82,
                          height: 30,
                          decoration: BoxDecoration(
                            color: colorHexa("055de8"),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "Read",
                            style: GoogleFonts.poppins(
                                color: colorHexa("ffffff"),
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    ),
  );
}
