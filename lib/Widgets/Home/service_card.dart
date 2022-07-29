import 'package:flutter/material.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class ServiceCard extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final String title;
  final VoidCallback behavior;

  const ServiceCard({
    required this.backgroundColor,
    required this.imagePath,
    required this.title,
    required this.behavior,
    Key? key,
  }) : super(key: key);

  final _borderRadius = 8.0;

  final _sectionCardHeight = 200.0;
  final _overlayOpacity = 0.3;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: behavior,
      child: _buildContent(),
    );
  }

  Stack _buildContent() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildCard(),
        _buildOverlay(),
        _buildTitle(),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      height: _sectionCardHeight,
      decoration: _buildDecoration(),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: backgroundColor,
      image: DecorationImage(image: AssetImage(imagePath)),
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildOverlay() {
    return Container(
      height: _sectionCardHeight,
      decoration: _buildOverlayDecoration(),
    );
  }

  BoxDecoration _buildOverlayDecoration() {
    return BoxDecoration(
      color: Colors.black.withOpacity(_overlayOpacity),
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildTitle2(
      title,
      weight: FontWeights.semiBold,
      color: ColorsFactory.secondary,
    );
  }
}
