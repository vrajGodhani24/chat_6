
import  'package:chat_app_3/Modules/Views/Home_Screen/Controller/Tab_Controller/tab_controller.dart';
import 'package:chat_app_3/Modules/Views/Home_Screen/Views/Components/Tabs/ChatTab/chat_tab.dart';
import 'package:chat_app_3/Modules/Views/Home_Screen/Views/Components/Widgets/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/constant.dart';
import '../../../../utils/helper/Authentication_Helper/auth_helper.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TabsController tabsController = Get.put(TabsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          IconButton(
            onPressed: () {
              Auth_Helper.auth_helper.signOut();
              Get.toNamed('/login');
            },
            icon: Icon(Icons.login),
          ),
        ],
        backgroundColor: Constant.appColor,
        titleTextStyle: TextStyle(color: Constant.textcolor, fontSize: 28),
        title: Text("WhatsApp"),
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
          unselectedLabelColor: Colors.white60,
          dividerColor: Constant.textcolor,
          labelColor: Constant.textcolor,
          indicatorColor: Constant.textcolor,
          controller: tabsController.controller,
          tabs: tabsController.tabs,
        ),
      ),
      body: TabBarView(
        controller: tabsController.controller,
        children: [ChatTab(), ChatTab(), ChatTab()],
      ),
    );
  }
}
