import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/avatar.dart';
import '/Widgets/Profile/portfolio.dart';
import '/Widgets/Profile/packages.dart';
import '/Widgets/Profile/tips.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/Profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentTab = 0;

  final _tabsLength = 3;

  static const _portfolioTabIndex = 0;
  static const _packagesTabIndex = 1;
  static const _tipsTabIndex = 2;

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 15.0;
  final _internalMargin = 5.0;

  final _avatarRadius = 100.0;

  final _viewMargin = 20.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsLength,
      child: Scaffold(
        appBar: const BackAppBar(title: MRKStrings.profileTitle),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfo(),
          SizedBox(height: _contentMargin),
          _buildTabBar(),
          SizedBox(height: _viewMargin),
          _buildView(),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        _buildAvatar(),
        SizedBox(height: _contentMargin),
        _buildName(),
        SizedBox(height: _contentMargin),
        _buildStats(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Avatar(radius: _avatarRadius),
        const Icon(Icons.qr_code),
      ],
    );
  }

  Widget _buildName() {
    return TextFactory.buildNormalText1(
      'Jack Sparrow',
      weight: FontWeights.medium,
      color: ColorsFactory.primary,
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildRatingStat(),
        SizedBox(width: _internalMargin),
        _buildTipsStat(),
        SizedBox(width: _internalMargin),
        _buildVotesStat(),
      ],
    );
  }

  Widget _buildRatingStat() {
    return _buildStatTile(
      Icons.star,
      MRKStrings.profileStatsRate,
      4.75,
      ColorsFactory.rate,
    );
  }

  Widget _buildTipsStat() {
    return _buildStatTile(
      Icons.tips_and_updates,
      MRKStrings.profileStatsTips,
      37,
      ColorsFactory.hyperlink,
    );
  }

  Widget _buildVotesStat() {
    return _buildStatTile(
      Icons.thumb_up,
      MRKStrings.profileStatsVotes,
      735,
      ColorsFactory.success,
    );
  }

  Widget _buildStatTile(IconData icon, String label, num value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        SizedBox(height: _internalMargin),
        TextFactory.buildNormalText4(label, color: color),
        SizedBox(height: _internalMargin),
        TextFactory.buildNormalText4(
          '$value',
          weight: FontWeights.medium,
          color: color,
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      onTap: _onTabChange,
      indicatorColor: ColorsFactory.primary,
      labelStyle: TextFactory.buildStyle(),
      labelColor: ColorsFactory.primary,
      unselectedLabelColor: ColorsFactory.secondaryText,
      tabs: [
        Tab(text: MRKStrings.profilePortfolio.tr),
        Tab(text: MRKStrings.profilePackages.tr),
        Tab(text: MRKStrings.profileTips.tr),
      ],
    );
  }

  Widget _buildView() {
    switch (_currentTab) {
      case _portfolioTabIndex:
        return const Portfolio();
      case _packagesTabIndex:
        return const Packages();
      case _tipsTabIndex:
        return const Tips();
      default:
        return const SizedBox();
    }
  }

  void _onTabChange(int index) {
    if (index == _currentTab) return;
    setState(() => _currentTab = index);
  }
}
