import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/avatar.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Controllers/authentication_controller.dart';

class Greeting extends StatelessWidget {
  Greeting({Key? key}) : super(key: key);

  final _profile = Get.find<AuthenticationController>().profile.value;

  final _contentMargin = 10.0;
  final _internalMargin = 5.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDrawer(context),
        SizedBox(width: _contentMargin),
        _buildInfo(),
        const Spacer(),
        _buildAvatar(),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return IconButton(
      onPressed: () => _openDrawer(context),
      icon: const Icon(Icons.menu),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        SizedBox(height: _internalMargin),
        _buildName(),
      ],
    );
  }

  Widget _buildLabel() {
    return TextFactory.buildNormalText1(MRKStrings.homeGreeting);
  }

  Widget _buildName() {
    return TextFactory.buildNormalText1(
      '${_profile?.name}',
      weight: FontWeights.medium,
    );
  }

  Widget _buildAvatar() {
    return Avatar(url: _profile?.avatar);
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
