import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/Widgets/Shared/avatar.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  final _contentMargin = 15.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView(
      children: [
        _buildHeader(),
        _buildProfile(),
        _buildChats(),
        _buildWallet(),
        _buildSettings(),
        _buildSupport(),
      ],
    );
  }

  Widget _buildHeader() {
    return DrawerHeader(
      child: _buildHeaderContent(),
    );
  }

  Widget _buildHeaderContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar(),
        SizedBox(height: _contentMargin),
        _buildName(),
      ],
    );
  }

  Widget _buildAvatar() {
    return const Avatar();
  }

  Widget _buildName() {
    return TextFactory.buildNormalText2(
      'Jack Sparrow',
      weight: FontWeights.medium,
      color: ColorsFactory.primary,
    );
  }

  Widget _buildProfile() {
    return _buildTile(
      Icons.person,
      MRKStrings.homeDrawerProfile,
      () {},
    );
  }

  Widget _buildChats() {
    return _buildTile(
      CupertinoIcons.chat_bubble_text_fill,
      MRKStrings.homeDrawerChats,
      () {},
    );
  }

  Widget _buildWallet() {
    return _buildTile(
      Icons.wallet,
      MRKStrings.homeDrawerWallet,
      () {},
    );
  }

  Widget _buildSettings() {
    return _buildTile(
      Icons.settings,
      MRKStrings.homeDrawerSettings,
      () {},
    );
  }

  Widget _buildSupport() {
    return _buildTile(
      Icons.support,
      MRKStrings.homeDrawerSupport,
      () {},
    );
  }

  Widget _buildTile(IconData icon, String label, VoidCallback behavior) {
    return ListTile(
      onTap: behavior,
      leading: Icon(icon, color: ColorsFactory.primary),
      title: TextFactory.buildNormalText3(
        label,
        weight: FontWeights.medium,
        color: ColorsFactory.primary,
      ),
    );
  }
}