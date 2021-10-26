import 'package:auto_size_text/auto_size_text.dart';
import 'package:blogdefi/icon_defi_blog/icon_blog_defi_icons.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import 'load/loading_animation.dart';
import 'load/loading_animation_1.dart';


Widget _listTile(title){
  return ListTile(
    title: Text('$title'),
    onTap: () {
      // Update the state of the app.
      // ...
    },
  );
}

Widget leadingAppBar(BuildContext context) {
  return GestureDetector(
    onTap: () => Scaffold.of(context).openDrawer(),
    child: Icon(
      IconBlogDefi.list,
      color: colorIconAppBar,
      size: 20,
    ),
  );
}

Widget drawerAppBar(BuildContext context){
  return ClipRRect(
    borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
    child: Container(
      alignment: Alignment.centerLeft,
      width: 250,
      child: Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 80, left: 25, bottom: 80),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      IconBlogDefi.close,
                      color: colorIconAppBar,
                    ),
                  )),
              _listTile("Home"),
              _listTile("Defi new"),
              _listTile("Defi project"),
              _listTile("Blockchain"),
              _listTile("Reviews"),
              _listTile("NFTs"),
              _listTile("Defi101"),
            ],
          ),
        ),
      ),
    ),
  );
}


//type 0: Home
//type 1: Setting
List<Widget> actionsAppBar(BuildContext context ,int type) {
  return [
    GestureDetector(
      onTap:() {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeMainPage(selectedIndex: 2)), (route) => false);
      },
      child: Icon(
        IconBlogDefi.search,
        color: colorIconAppBar,
        size: 20,
      ),
    ),
    SizedBox(
      child: type == 0 ? Container(
        margin: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        width: 35,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        // height: 10,
      ) : Container(width: 30,),
    ),
  ];
}

Widget newPageProgressIndicatorBuilder() {
  return Center(
    child: ColorLoader5(
      dotOneColor: colorLoadingAnimation,
      dotTwoColor: colorLoadingAnimation,
      dotThreeColor: colorLoadingAnimation,
      dotType: DotType.circle,
      dotIcon: const Icon(Icons.adjust),
      duration: const Duration(seconds: 1),
    ),
  );
}

// Dùng cho PagedChildBuilderDelegate trong PagedSliverList
Widget firstPageProgressIndicatorBuilder() {
  return Center(
    child: ColorLoader(dotRadius: 6,radius: 20,),
  );
}

// Dùng cho PagedChildBuilderDelegate trong PagedSliverList
Widget firstPageErrorIndicatorBuilder(BuildContext context, {String? tittle}) {
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: 50,
    child: Center(
        child: AutoSizeText(
          "$tittle",
          style: TextStyle(color: colorIconAppBar, fontSize: 16),
        )),
  );
}

Widget leadingAppbar(BuildContext context, {Widget? widget, Color? colorIcon}) {
  return IconButton(
    icon: Icon(Icons.arrow_back_ios_outlined,
        color: colorIcon ?? Colors.white),
    onPressed: () => widget != null
        ? Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false)
        : Navigator.of(context).pop(),
  );
}