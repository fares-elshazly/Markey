import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/Widgets/Shared/avatar.dart';
import '/Widgets/Profile/profile_tile.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/Profile';

  const ProfileScreen({Key? key}) : super(key: key);

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 40.0;
  final _internalMargin = 20.0;
  final _tilesMargin = 10.0;

  final _avatarRadius = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: _bodyVerticalMargin),
          _buildUser(),
          SizedBox(height: _contentMargin),
          _buildTiles(),
          SizedBox(height: _bodyVerticalMargin),
        ],
      ),
    );
  }

  Widget _buildUser() {
    return Column(
      children: [
        _buildAvatar(),
        SizedBox(height: _internalMargin),
        _buildName(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Avatar(radius: _avatarRadius);
  }

  Widget _buildName() {
    return TextFactory.buildTitle2(
      'Jack Sparrow',
      weight: FontWeights.medium,
    );
  }

  Widget _buildTiles() {
    return Column(
      children: [
        _buildBecomeExpert(),
        SizedBox(height: _tilesMargin),
        _buildEditProfile(),
        SizedBox(height: _tilesMargin),
        _buildLanguage(),
        SizedBox(height: _tilesMargin),
        _buildPrivacy(),
        SizedBox(height: _tilesMargin),
        _buildShare(),
        SizedBox(height: _tilesMargin),
        _buildLogout(),
      ],
    );
  }

  Widget _buildBecomeExpert() {
    return ProfileTile(
      icon: CupertinoIcons.briefcase,
      title: MRKStrings.profileBecomeExpert,
      behavior: () {},
    );
  }

  Widget _buildEditProfile() {
    return ProfileTile(
      icon: CupertinoIcons.pencil_outline,
      title: MRKStrings.profileEdit,
      behavior: () {},
    );
  }

  Widget _buildLanguage() {
    return ProfileTile(
      icon: CupertinoIcons.globe,
      title: MRKStrings.profileLanguage,
      behavior: () {},
    );
  }

  Widget _buildPrivacy() {
    return ProfileTile(
      icon: CupertinoIcons.eye,
      title: MRKStrings.profilePrivacy,
      behavior: () {},
    );
  }

  Widget _buildShare() {
    return ProfileTile(
      icon: CupertinoIcons.paperplane,
      title: MRKStrings.profileShare,
      behavior: () {},
    );
  }

  Widget _buildLogout() {
    return ProfileTile(
      icon: CupertinoIcons.escape,
      title: MRKStrings.profileLogout,
      behavior: () {},
    );
  }
}
