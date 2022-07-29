import 'dart:math';

import 'package:flutter/material.dart';

import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';

class ConversationTile extends StatelessWidget {
  final int index;

  const ConversationTile({required this.index, Key? key}) : super(key: key);

  final _borderRadius = 8.0;
  final _maxLines = 1;

  final _images = const [
    MRKImages.shop1,
    MRKImages.shop2,
    MRKImages.shop3,
    MRKImages.shop4,
    MRKImages.shop5,
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ColorsFactory.secondary,
      shape: _buildShape(),
      leading: _buildAvatar(),
      title: _buildName(),
      subtitle: _buildLastMessage(),
      trailing: _buildLastMessageDateTime(),
    );
  }

  ShapeBorder _buildShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      foregroundImage: AssetImage(_images[index % _images.length]),
    );
  }

  Widget _buildName() {
    return TextFactory.buildNormalText3(
      'Lorem Ipsum',
      weight: FontWeights.medium,
    );
  }

  Widget _buildLastMessage() {
    return TextFactory.buildNormalText4(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt lectus vel diam maximus, nec molestie ipsum blandit.',
      color: ColorsFactory.secondaryText,
      maxLines: _maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildLastMessageDateTime() {
    return TextFactory.buildNormalText4(
      Helpers.previewDateTime(_generateDateTime()),
    );
  }

  DateTime _generateDateTime() {
    final randomHours = Random().nextInt(48);
    final randomDuration = Duration(hours: randomHours);
    return DateTime.now().subtract(randomDuration);
  }
}
