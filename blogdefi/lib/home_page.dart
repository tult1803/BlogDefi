import 'package:blogdefi/utils/color.dart';
import 'package:blogdefi/view/home/home_page.dart';
import 'package:blogdefi/view/mark/mark_page.dart';
import 'package:blogdefi/view/notification/notification_page.dart';
import 'package:blogdefi/view/search/search_page.dart';
import 'package:blogdefi/view/settings/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'icon_defi_blog/icon_blog_defi_icons.dart';

class HomeMainPage extends StatefulWidget {
  int selectedIndex;

  HomeMainPage({required this.selectedIndex});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeMainPage> {
  late Widget _widget;
  bool? isNewNoti;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _widget = indexWidgetMainPage(index: widget.selectedIndex);
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNewNoti = prefs.getBool("isNewNoti");
    setState(() {});
    print("isNewNoti: $isNewNoti");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          _widget,
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: GNav(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    tabBorderRadius: 45,
                    rippleColor: colorTap,
                    hoverColor: colorTap,
                    // haptic: true,
                    curve: Curves.bounceIn,
                    duration: const Duration(milliseconds: 100),
                    gap: 0,
                    color: colorUnSelectedIconBottomNavigationBar,
                    activeColor: colorSelectedIconBottomNavigationBar,
                    iconSize: 24,
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, bottom: 20, top: 20),
                    tabMargin: const EdgeInsets.only(left: 0, right: 0),
                    selectedIndex: widget.selectedIndex,
                    onTabChange: (value) async {
                      widget.selectedIndex = value;
                      _widget = await indexWidgetMainPage(
                          index: widget.selectedIndex);
                      setState(() {});
                    },
                    tabs: [
                      const GButton(
                        icon: IconBlogDefi.home,
                        // text: 'Home',
                      ),
                      const GButton(
                        icon: IconBlogDefi.mark,
                        // text: 'Mark',
                      ),
                      const GButton(
                        icon: IconBlogDefi.search,
                        // text: 'Search',
                      ),
                      GButton(
                        icon: IconBlogDefi.notification,
                        // text: 'New',
                        iconColor:
                            isNewNoti == true ? Colors.blueAccent : Colors.black54,
                        onPressed: () async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool("isNewNoti", false);
                          isNewNoti = false;
                          setState(() {});
                        },
                      ),
                      const GButton(
                        icon: IconBlogDefi.setting,
                      )
                    ]),
              )),
        ],
      ),
    );
  }

  indexWidgetMainPage({required int index}) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return MarkPage();
      case 2:
        return SearchPage();
      case 3:
        return NotificationPage();
      case 4:
        return SettingPage();
    }
  }
}
