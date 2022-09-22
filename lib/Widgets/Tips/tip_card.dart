import 'dart:math';

import 'package:flutter/material.dart';

import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';

class TipCard extends StatelessWidget {
  final int index;

  const TipCard({required this.index, Key? key}) : super(key: key);

  final _textMargin = 4.0;
  final _iconSize = 18.0;
  final _contentMargin = 10.0;

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
      onTap: _viewTips,
      leading: _buildAvatar(),
      title: _buildTitle(),
      subtitle: _buildBody(),
      trailing: _buildDateTime(),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      foregroundImage: AssetImage(
        _images[index % _images.length],
      ),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText3(
      '${_generateTipsNumber()} Tips in Lorem Ipsum',
      weight: FontWeights.medium,
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildName(),
        SizedBox(height: _contentMargin),
        _buildStats(),
      ],
    );
  }

  Widget _buildName() {
    return TextFactory.buildNormalText4(
      '@Username',
      color: ColorsFactory.hyperlink,
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRepost(),
        _buildRate(),
        _buildShare(),
      ],
    );
  }

  Widget _buildRepost() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.sync, size: _iconSize, color: ColorsFactory.tertiaryText),
        SizedBox(width: _textMargin),
        TextFactory.buildNormalText4('${_generateRepost()}'),
      ],
    );
  }

  Widget _buildRate() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: _iconSize, color: ColorsFactory.rate),
        SizedBox(width: _textMargin),
        TextFactory.buildNormalText4(_generateRate().toStringAsFixed(1)),
      ],
    );
  }

  Widget _buildShare() {
    return IconButton(
      onPressed: _share,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Icon(Icons.share, size: _iconSize),
    );
  }

  Widget _buildDateTime() {
    return TextFactory.buildNormalText4(
      Helpers.timeAgo(_generateDateTime()),
      color: ColorsFactory.secondaryText,
    );
  }

  void _viewTips() {}

  int _generateTipsNumber() {
    return Random().nextInt(20) + 1;
  }

  int _generateRepost() {
    return Random().nextInt(1000) + 1;
  }

  double _generateRate() {
    return Random().nextDouble() * 5;
  }

  DateTime _generateDateTime() {
    final randomHours = Random().nextInt(48);
    final randomDuration = Duration(hours: randomHours);
    return DateTime.now().subtract(randomDuration);
  }

  void _share() {}
}
