import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Tips/tips.dart';
import '/Widgets/Home/greeting.dart';
import '/Widgets/Home/service_card.dart';
import '/Widgets/Home/shop_card.dart';
import '/Resources/strings.dart';
import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/Home';

  const HomeScreen({Key? key}) : super(key: key);

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 30.0;
  final _internalMargin = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
        child: SafeArea(child: _buildContent()),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: _bodyVerticalMargin),
          const Greeting(),
          SizedBox(height: _contentMargin),
          _buildServices(),
          SizedBox(height: _contentMargin),
          _buildMall(),
          SizedBox(height: _bodyVerticalMargin),
        ],
      ),
    );
  }

  Widget _buildServices() {
    return Row(
      children: [
        Expanded(child: _buildTipsCard()),
        SizedBox(width: _internalMargin),
        Expanded(child: _buildCommunityCard()),
      ],
    );
  }

  Widget _buildTipsCard() {
    return ServiceCard(
      backgroundColor: ColorsFactory.tips,
      imagePath: MRKImages.tips,
      title: MRKStrings.homeTips,
      behavior: _tips,
    );
  }

  Widget _buildCommunityCard() {
    return ServiceCard(
      backgroundColor: ColorsFactory.community,
      imagePath: MRKImages.community,
      title: MRKStrings.homeCommunity,
      behavior: _community,
    );
  }

  Widget _buildMall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMallTitle(),
        SizedBox(height: _internalMargin),
        _buildMallShops(),
      ],
    );
  }

  Widget _buildMallTitle() {
    return TextFactory.buildTitle2(
      MRKStrings.homeMall,
      weight: FontWeights.semiBold,
    );
  }

  Widget _buildMallShops() {
    return ListView.builder(
      itemCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildShopCard(index);
      },
    );
  }

  Widget _buildShopCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: ShopCard(index: index),
    );
  }

  void _tips() {
    Get.toNamed(TipsScreen.routeName);
  }

  void _community() {}
}
