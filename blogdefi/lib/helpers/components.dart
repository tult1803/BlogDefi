import 'package:blogdefi/icon_defi_blog/icon_blog_defi_icons.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:flutter/material.dart';


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
List<Widget> actionsAppBar(int type) {
  return [
    GestureDetector(
      onTap: () {
        print('Click search');
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