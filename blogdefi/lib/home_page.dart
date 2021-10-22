import 'package:blogdefi/utils/color.dart';
import 'package:blogdefi/view/home/home_page.dart';
import 'package:blogdefi/view/mark/mark_page.dart';
import 'package:blogdefi/view/notification/notification_page.dart';
import 'package:blogdefi/view/search/search_page.dart';
import 'package:blogdefi/view/settings/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'icon_defi_blog/icon_blog_defi_icons.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeMainPage> {
  late int _selectedIndex;
  late Widget _widget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = 0;
    _widget = HomePage();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
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
            child: SafeArea(
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
                        left: 5, right: 5, bottom: 20),
                    tabMargin: const EdgeInsets.only(left: 0, right: 0),
                    selectedIndex: _selectedIndex,
                    onTabChange: (value) async {
                      _selectedIndex = value;
                      _widget =
                          await indexWidgetMainPage(index: _selectedIndex);
                      setState(() {});
                    },
                    tabs: const [
                  GButton(
                    icon: IconBlogDefi.home,
                    // text: 'Home',
                  ),
                  GButton(
                    icon: IconBlogDefi.mark,
                    // text: 'Mark',
                  ),
                  GButton(
                    icon: IconBlogDefi.search,
                    // text: 'Search',
                  ),
                  GButton(
                    icon: IconBlogDefi.notification,
                    // text: 'Noti',
                  ),
                  GButton(
                    icon: IconBlogDefi.setting,
                  )
                ])),
          )),
        ],
      ),
      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(28),
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 20,
      //         color: Colors.black.withOpacity(.1),
      //       )
      //     ],
      //   ),
      //   child: SafeArea(
      //       child: GNav(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           tabBorderRadius: 45,
      //           rippleColor: colorTap,
      //           hoverColor: colorTap,
      //           // haptic: true,
      //           curve: Curves.bounceIn,
      //           duration: const Duration(milliseconds: 100),
      //           gap: 0,
      //           color: colorUnSelectedIconBottomNavigationBar,
      //           activeColor: colorSelectedIconBottomNavigationBar,
      //           iconSize: 24,
      //           padding: const EdgeInsets.only(
      //               left: 5, right: 5, top: 20, bottom: 20),
      //           tabMargin: const EdgeInsets.only(left: 0, right: 0),
      //           selectedIndex: _selectedIndex,
      //           onTabChange: (value) async {
      //             _selectedIndex = value;
      //             _widget = await indexWidgetMainPage(index: _selectedIndex);
      //             setState(() {});
      //           },
      //           tabs: const [
      //         GButton(
      //           icon: IconBlogDefi.home,
      //           // text: 'Home',
      //         ),
      //         GButton(
      //           icon: IconBlogDefi.mark,
      //           // text: 'Mark',
      //         ),
      //         GButton(
      //           icon: IconBlogDefi.search,
      //           // text: 'Search',
      //         ),
      //         GButton(
      //           icon: IconBlogDefi.notification,
      //           // text: 'Noti',
      //         ),
      //         GButton(
      //           icon: IconBlogDefi.setting,
      //         )
      //       ])),
      // ),
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
