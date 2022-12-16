import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/Models/Profile/package.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';
import '/Controllers/profile_controller.dart';

class Packages extends StatelessWidget {
  final List<Package> packages;
  final bool isCurrentUser;

  Packages({
    required this.packages,
    this.isCurrentUser = false,
    Key? key,
  }) : super(key: key);

  final _authController = Get.find<AuthenticationController>();
  final _profileController = Get.find<ProfileController>();

  final _internalMargin = 5.0;
  final _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: packages.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildContent(packages[index]);
      },
    );
  }

  Widget _buildContent(Package package) {
    if (isCurrentUser) {
      return _buildDismissiblePackage(package);
    }
    return _buildPackageCard(package);
  }

  Widget _buildDismissiblePackage(Package package) {
    return Dismissible(
      key: Key(package.id.toString()),
      background: _buildDismissibleBackground(),
      child: _buildPackageCard(package),
      onDismissed: (_) => _delete(package.id),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _internalMargin),
      decoration: BoxDecoration(
        color: ColorsFactory.danger,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
    );
  }

  Widget _buildPackageCard(Package package) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: _buildPackageCardContent(package),
    );
  }

  Widget _buildPackageCardContent(Package package) {
    return ListTile(
      isThreeLine: true,
      tileColor: ColorsFactory.secondary,
      shape: _buildShape(),
      title: _buildTitle(package.title),
      subtitle: _buildInfo(package),
      trailing: _buildPrice(package.cost),
    );
  }

  ShapeBorder _buildShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildTitle(String title) {
    return TextFactory.buildNormalText3(
      title,
      weight: FontWeights.medium,
    );
  }

  Widget _buildInfo(Package package) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDescription(package.description),
        SizedBox(height: _internalMargin),
        _buildDuration(package.duration),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return TextFactory.buildNormalText4(
      description,
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildDuration(int duration) {
    return TextFactory.buildNormalText4(
      '$duration Days',
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildPrice(double price) {
    return TextFactory.buildNormalText4('$price £');
  }

  Future<void> _delete(int id) async {
    ProgressIndicators.loadingDialog();
    try {
      await _profileController.deletePackage(id);
      await _authController.getProfile();
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }
}
