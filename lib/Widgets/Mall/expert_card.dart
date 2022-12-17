import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Profile/expert_profile.dart';
import '/Widgets/Shared/avatar.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Models/Profile/profile.dart';

class ExpertCard extends StatelessWidget {
  final Profile expert;

  const ExpertCard({required this.expert, Key? key}) : super(key: key);

  final _borderRadius = 8.0;
  final _padding = 10.0;
  final _contentMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _navigate,
      child: Container(
        padding: EdgeInsets.all(_padding),
        decoration: _buildDecoration(),
        child: _buildContent(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: ColorsFactory.secondary,
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildAvatar(),
        SizedBox(height: _contentMargin),
        _buildName(),
        SizedBox(height: _contentMargin / 2),
        _buildUsername(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Avatar(url: expert.avatar);
  }

  Widget _buildName() {
    return TextFactory.buildNormalText3(
      expert.name,
      weight: FontWeights.medium,
    );
  }

  Widget _buildUsername() {
    return TextFactory.buildNormalText4(
      '@${expert.username}',
      color: ColorsFactory.hyperlink,
    );
  }

  void _navigate() {
    Get.to(ExpertProfileScreen(expertId: expert.id));
  }
}
