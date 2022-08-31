import 'dart:math';

import 'package:flutter/material.dart';

import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  final _internalMargin = 5.0;
  final _borderRadius = 8.0;
  final _thumbSide = 60.0;
  final _textMargin = 4.0;

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
        return _buildTipCard(index);
      },
    );
  }

  Widget _buildTipCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: _buildTipCardContent(index),
    );
  }

  Widget _buildTipCardContent(int index) {
    return ListTile(
      tileColor: ColorsFactory.secondary,
      shape: _buildShape(),
      leading: _buildThumbnail(index),
      title: _buildTitle(),
      subtitle: _buildDateTime(),
      trailing: _buildRate(),
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
      '${_generateTipsNumber()} Tips in Lorem Ipsum',
      weight: FontWeights.medium,
    );
  }

  Widget _buildDateTime() {
    return TextFactory.buildNormalText4(
      Helpers.timeAgo(_generateDateTime()),
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildRate() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: ColorsFactory.rate),
        SizedBox(width: _textMargin),
        TextFactory.buildNormalText4(
          (Random().nextDouble() * 5).toStringAsFixed(1),
        ),
      ],
    );
  }

  int _generateTipsNumber() {
    return Random().nextInt(20) + 1;
  }

  DateTime _generateDateTime() {
    final randomHours = Random().nextInt(48);
    final randomDuration = Duration(hours: randomHours);
    return DateTime.now().subtract(randomDuration);
  }
}
