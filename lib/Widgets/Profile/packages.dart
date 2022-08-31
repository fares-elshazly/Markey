import 'package:flutter/material.dart';

import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class Packages extends StatelessWidget {
  const Packages({Key? key}) : super(key: key);

  final _internalMargin = 5.0;
  final _borderRadius = 8.0;
  final _thumbSide = 60.0;

  final _images = const [
    MRKImages.shop1,
    MRKImages.shop2,
    MRKImages.shop3,
    MRKImages.shop4,
    MRKImages.shop5,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildPackageCard(index);
      },
    );
  }

  Widget _buildPackageCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: _buildPackageCardContent(index),
    );
  }

  Widget _buildPackageCardContent(int index) {
    return ListTile(
      isThreeLine: true,
      tileColor: ColorsFactory.secondary,
      shape: _buildShape(),
      leading: _buildThumbnail(index),
      title: _buildTitle(),
      subtitle: _buildDescription(),
      trailing: _buildPrice(),
    );
  }

  ShapeBorder _buildShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildThumbnail(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Image.asset(
        _images[index % _images.length],
        width: _thumbSide,
        height: _thumbSide,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText3(
      'Logo Design',
      weight: FontWeights.medium,
    );
  }

  Widget _buildDescription() {
    return TextFactory.buildNormalText4(
      'Design a modern and graphic logo from scratch',
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildPrice() {
    return TextFactory.buildNormalText4('500\$');
  }
}
