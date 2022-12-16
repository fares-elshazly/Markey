import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/Screens/Shared/splash.dart';
import '/Screens/Profile/profile.dart';
import '/Screens/Chat/chat.dart';
import '/Screens/Settings/settings.dart';
import '/Widgets/Shared/background.dart';
import '/Widgets/Shared/avatar.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Controllers/authentication_controller.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  final _authController = Get.find<AuthenticationController>();
  final _profile = Get.find<AuthenticationController>().profile.value;

  final _contentMargin = 15.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildContent(),
        const Background(),
      ],
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
        _buildLogout(),
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
    return Avatar(url: _profile?.avatar);
  }

  Widget _buildName() {
    return TextFactory.buildNormalText2(
      '${_profile?.name}',
      weight: FontWeights.medium,
      color: ColorsFactory.primary,
    );
  }

  Widget _buildProfile() {
    return _buildTile(
      Icons.person,
      MRKStrings.homeDrawerProfile,
      () => Get.toNamed(ProfileScreen.routeName),
    );
  }

  Widget _buildChats() {
    return _buildTile(
      CupertinoIcons.chat_bubble_text_fill,
      MRKStrings.homeDrawerChats,
      () => Get.toNamed(ChatScreen.routeName),
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
      () => Get.toNamed(SettingsScreen.routeName),
    );
  }

  Widget _buildSupport() {
    return _buildTile(
      Icons.support,
      MRKStrings.homeDrawerSupport,
      () {},
    );
  }

  Widget _buildLogout() {
    return _buildTile(
      Icons.logout,
      MRKStrings.homeDrawerLogout,
      _logout,
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

  Future<void> _logout() async {
    await _authController.logout();
    Get.offAllNamed(SplashScreen.routeName);
  }
}
