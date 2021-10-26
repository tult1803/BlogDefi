import 'package:blogdefi/helpers/components.dart';
import 'package:blogdefi/helpers/container.dart';
import 'package:blogdefi/icon_defi_blog/icon_blog_defi_icons.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorAppBar,
      appBar: AppBar(
        // iconTheme: IconThemeData(color: colorIconAppBar),
        backgroundColor: colorAppBar,
        leading: Builder(builder: (context) => leadingAppBar(context)),
        actions: actionsAppBar(context ,1),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: containerTitle("Settings", fontSize: 30, isShowIcon: false),
          ),
          _listTile(title: "Profile settings", subTitle: "Settings regarding your profile", icon: Icons.person),
          _listTile(title: "News settings", subTitle: "Choose your favourite topics", icon: Icons.assignment_outlined),
          _listTile(title: "Notifications", subTitle: "When would you like to be notified", icon: IconBlogDefi.notification),
        ],
      ),
      drawer: drawerAppBar(context),
    );
  }

  Widget _listTile({title, subTitle, icon}) {
    return ListTile(
      onTap: () {},
      leading: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(20, 30, 40, 0.08),
        ),
        child: Icon(icon, size: 30, color: colorHexa("141e28"),),
      ),
      title: Text("$title"),
      subtitle: Text("$subTitle"),
    );
  }
}
