import 'package:flutter/material.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Models/Profile/package.dart';

class Packages extends StatelessWidget {
  final List<Package> packages;

  const Packages({required this.packages, Key? key}) : super(key: key);

  final _internalMargin = 5.0;
  final _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: packages.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildPackageCard(packages[index]);
      },
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
}
