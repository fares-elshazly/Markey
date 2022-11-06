import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Tipsters/tip_details.dart';
import '/Widgets/Shared/avatar.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Models/Tips/tip.dart';

class TipCard extends StatelessWidget {
  final Tip tip;

  const TipCard({required this.tip, Key? key}) : super(key: key);

  final _textMargin = 4.0;
  final _iconSize = 18.0;
  final _contentMargin = 10.0;

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
    return const Avatar();
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText3(tip.title, weight: FontWeights.medium);
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
      children: [
        _buildSpread(),
        SizedBox(width: _contentMargin),
        _buildRate(),
      ],
    );
  }

  Widget _buildSpread() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.sync, size: _iconSize, color: ColorsFactory.tertiaryText),
        SizedBox(width: _textMargin),
        TextFactory.buildNormalText4('${tip.spreadCount}'),
      ],
    );
  }

  Widget _buildRate() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: _iconSize, color: ColorsFactory.rate),
        SizedBox(width: _textMargin),
        TextFactory.buildNormalText4('${tip.rate}'),
      ],
    );
  }

  Widget _buildDateTime() {
    return TextFactory.buildNormalText4(
      Helpers.timeAgo(DateTime.now()),
      color: ColorsFactory.secondaryText,
    );
  }

  void _viewTips() {
    Get.toNamed(TipDetailsScreen.routeName, arguments: tip);
  }
}
