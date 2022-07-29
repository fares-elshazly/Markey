import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/Screens/Viewer/home.dart';
import '/Screens/Viewer/chat.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class ViewerScreen extends StatelessWidget {
  static const routeName = '/Viewer';

  const ViewerScreen({Key? key}) : super(key: key);

  static const List<Widget> _tabs = [
    HomeScreen(),
    ChatScreen(),
    SizedBox(),
    SizedBox(),
  ];

  final _padding = 10.0;
  final _borderRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: _buildTabs(),
        bottomNavigationBar: _buildTabBar(),
      ),
    );
  }

  Widget _buildTabs() {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: _tabs,
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: EdgeInsets.only(bottom: _padding),
      decoration: _buildTabBarDecoration(),
      child: SafeArea(child: _buildTabBarContent()),
    );
  }

  BoxDecoration _buildTabBarDecoration() {
    return BoxDecoration(
      color: ColorsFactory.secondary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_borderRadius),
        topRight: Radius.circular(_borderRadius),
      ),
    );
  }

  Widget _buildTabBarContent() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: ColorsFactory.primary,
      labelColor: ColorsFactory.primary,
      labelStyle: TextFactory.buildStyle(size: TextFactory.normalText5Size),
      tabs: [
        Tab(
          icon: const Icon(CupertinoIcons.home),
          text: MRKStrings.viewerHome.tr,
        ),
        Tab(
          icon: const Icon(CupertinoIcons.bubble_left_bubble_right),
          text: MRKStrings.viewerChat.tr,
        ),
        Tab(
          icon: const Icon(CupertinoIcons.bell),
          text: MRKStrings.viewerNotifications.tr,
        ),
        Tab(
          icon: const Icon(CupertinoIcons.person_crop_circle),
          text: MRKStrings.viewerProfile.tr,
        ),
      ],
    );
  }
}
