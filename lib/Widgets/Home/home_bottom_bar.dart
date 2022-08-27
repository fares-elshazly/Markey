import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/Resources/strings.dart';
import '/Resources/icons.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  final _contentMargin = 10.0;
  final _padding = 10.0;
  final _iconWidth = 35.0;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTipsters(),
        SizedBox(width: _contentMargin),
        _buildCommunity(),
      ],
    );
  }

  Widget _buildTipsters() {
    return _buildItem(false, _buildTipstersContent(), _tipsters);
  }

  Widget _buildTipstersContent() {
    return Row(
      children: [
        _buildLabel(MRKStrings.homeTipsters),
        SizedBox(width: _contentMargin),
        _buildIcon(MRKIcons.tipsters),
      ],
    );
  }

  Widget _buildCommunity() {
    return _buildItem(true, _buildCommunityContent(), _community);
  }

  Widget _buildCommunityContent() {
    return Row(
      children: [
        _buildIcon(MRKIcons.community),
        SizedBox(width: _contentMargin),
        _buildLabel(MRKStrings.homeCommunity),
      ],
    );
  }

  Widget _buildItem(bool isFlipped, Widget content, VoidCallback behavior) {
    return InkWell(
      onTap: behavior,
      child: Stack(
        alignment: _buildAlignment(isFlipped),
        children: [
          _buildShape(isFlipped),
          _buildContent(content),
        ],
      ),
    );
  }

  AlignmentDirectional _buildAlignment(bool isFlipped) {
    if (isFlipped) return AlignmentDirectional.centerEnd;
    return AlignmentDirectional.centerStart;
  }

  Widget _buildShape(bool isFlipped) {
    return Transform.scale(
      scaleX: isFlipped ? -1 : 1,
      child: SvgPicture.asset(MRKIcons.bottomShape),
    );
  }

  Widget _buildContent(Widget content) {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: content,
    );
  }

  Widget _buildIcon(String iconPath) {
    return SvgPicture.asset(iconPath, width: _iconWidth);
  }

  Widget _buildLabel(String label) {
    return TextFactory.buildNormalText4(
      label,
      weight: FontWeights.medium,
      color: ColorsFactory.tertiaryText,
    );
  }

  void _tipsters() {}

  void _community() {}
}

class HomeFAB extends StatelessWidget {
  const HomeFAB({Key? key}) : super(key: key);

  final _fabDiameter = 100.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _submit,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: _fabDiameter,
      height: _fabDiameter,
      decoration: _buildDecoration(),
      child: _buildIcon(),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      gradient: _buildGradient(),
    );
  }

  LinearGradient _buildGradient() {
    return const LinearGradient(
      colors: [ColorsFactory.gradientTop, ColorsFactory.gradientBottom],
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
    );
  }

  Widget _buildIcon() {
    return SvgPicture.asset(
      MRKIcons.mall,
      fit: BoxFit.scaleDown,
    );
  }

  void _submit() {}
}
