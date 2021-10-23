import 'package:blogdefi/helpers/components.dart';
import 'package:blogdefi/helpers/container.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:flutter/material.dart';

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
        actions: actionsAppBar(1),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: containerTitle("Settings", fontSize: 30, isShowIcon: false),
          ),
        ],
      ),
      drawer: drawerAppBar(context),
    );
  }


}
