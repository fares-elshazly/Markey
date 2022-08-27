import 'package:flutter/material.dart';

import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class ServiceCard extends StatelessWidget {
  final int index;

  const ServiceCard({required this.index, Key? key}) : super(key: key);

  final _images = const [
    MRKImages.shop1,
    MRKImages.shop2,
    MRKImages.shop3,
    MRKImages.shop4,
    MRKImages.shop5,
  ];

  final _width = 300.0;
  final _height = 200.0;
  final _borderRadius = 8.0;
  final _overlayOpacity = 0.3;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildImage(),
        _buildOverlay(),
        _buildTitle(),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Image.asset(
        _images[index % _images.length],
        width: _width,
        height: _height,
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      width: _width,
      height: _height,
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
      'Lorem Ipsum',
      weight: FontWeights.semiBold,
      color: ColorsFactory.secondary,
    );
  }
}
