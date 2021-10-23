import 'package:blogdefi/helpers/components.dart';
import 'package:blogdefi/icon_defi_blog/icon_blog_defi_icons.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:blogdefi/view/home/mini/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late int _index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = 0;
    _tabController =
        TabController(length: 5, vsync: this, initialIndex: _index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorAppBar,
      appBar: AppBar(
        // iconTheme: IconThemeData(color: colorIconAppBar),
        backgroundColor: colorAppBar,
        leading: Builder(builder: (context) => leadingAppBar(context)),
        actions: actionsAppBar(0),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(width: size.width, height: 100, child: bottomAppBar()),
          // SizedBox(
          //     width: size.width,
          //     height: 1000,
          //     child: tabBarView()),
          Expanded(child: tabBarView()),
        ],
      ),
      drawer: drawerAppBar(context),
    );
  }

  Widget bottomAppBar() {
    return TabBar(
      // labelPadding: EdgeInsets.symmetric(horizontal: 7.0),
      indicatorColor: colorAppBar,
      isScrollable: true,
      labelColor: labelColor,
      unselectedLabelColor: Colors.grey,
      controller: _tabController,
      tabs: <Widget>[
        component("Home", 0),
        component("Defi new", 1),
        component("Defi project", 2),
        component("Blockchain", 3),
        component("Review", 4),
      ],
    );
  }

  Widget tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Home(),
        Container(
          child: Center(child: Text("Defi New")),
        ),
        Container(
          child: Center(child: Text("Defi Project")),
        ),
        Container(
          child: Center(child: Text("Blockchain")),
        ),
        Container(
          child: Center(child: Text("Review")),
        ),
      ],
    );
  }

  Widget component(String title, int index) {
    return GestureDetector(
      onTap: () {
        print('Tap $title');
        setState(() {
          _tabController.index = index;
        });
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: colorComponentTab,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
