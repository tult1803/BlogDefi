import 'package:blogdefi/helpers/container.dart';
import 'package:blogdefi/icon_defi_blog/icon_blog_defi_icons.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:flutter/material.dart';

import '../../data_demo.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
          children: [
            Container(
                width: size.width,
                height: 100,
                child: searchField()),
            Expanded(child: ListView(
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
            )),
          ],
      ),
    );

  }

  Widget searchField() {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 0),
      height: 60,
      child: TextField(
        cursorColor: colorIconAppBar,
        maxLines: 1,
        // textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: Padding(
            padding: const EdgeInsets.only( right: 18.0),
            child: Icon(
              IconBlogDefi.search,
              color: colorIconAppBar,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorIconAppBar,
              ),
              borderRadius: BorderRadius.circular(17)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }
}
