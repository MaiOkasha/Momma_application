

import 'package:flutter/material.dart';
import 'package:vp12_ui_application/screens/app/drawer/tabs/about_app_tab.dart';
import 'package:vp12_ui_application/screens/app/drawer/tabs/team_tab.dart';
class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen>with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length:2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
       backgroundColor: Colors.white,
       // elevation: 0,
        centerTitle: true,
        title: const Text('About App ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        bottom: TabBar(
         // isScrollable: true,
          labelColor: Colors.black,
          //unselectedLabelColor: Colors.blue,
          controller: _tabController,
         labelStyle: const TextStyle(
           fontWeight: FontWeight.bold,
         ),
         unselectedLabelStyle: const TextStyle(
           fontWeight: FontWeight.w300
         ),
         indicatorColor: Colors.orange,
         indicatorWeight: 5,
         indicatorSize: TabBarIndicatorSize.tab,
         indicatorPadding:  const EdgeInsets.only(
           bottom: 5,
         ),
         indicator:  BoxDecoration(
           border: Border.all(
             color: Colors.orange,
             width: 1
           ),
           color: Colors.transparent,
           borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
           ),

         tabs: const [
           Tab(text: 'App',),
           Tab(text: 'Team',),

         ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AboutAppTab(),
          TeamTab(),
        ],
      )
    );
  }
}
