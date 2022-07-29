import 'dart:math';

import 'package:flutter/material.dart';

import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class ShopCard extends StatelessWidget {
  final int index;

  const ShopCard({required this.index, Key? key}) : super(key: key);

  final _images = const [
    MRKImages.shop1,
    MRKImages.shop2,
    MRKImages.shop3,
    MRKImages.shop4,
    MRKImages.shop5,
  ];

  final _borderRadius = 8.0;
  final _padding = 10.0;
  final _internalMargin = 10.0;
  final _textMargin = 4.0;

  final _imageHeight = 200.0;
  final _maxLines = 2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _navigate,
      child: Container(
        decoration: _buildDecoration(),
        child: _buildContent(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: ColorsFactory.secondary,
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildImage(),
        _buildInfo(),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: _buildImageBorder(),
      child: Image.asset(
        _images[index % _images.length],
        width: double.infinity,
        height: _imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  BorderRadius _buildImageBorder() {
    return BorderRadius.only(
      topLeft: Radius.circular(_borderRadius),
      topRight: Radius.circular(_borderRadius),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: _buildInfoContent(),
    );
  }

  Widget _buildInfoContent() {
    return Column(
      children: [
        _buildNameAndRate(),
        SizedBox(height: _internalMargin),
        _buildBio(),
      ],
    );
  }

  Widget _buildNameAndRate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildName(),
        SizedBox(width: _internalMargin),
        _buildRate(),
      ],
    );
  }

  Widget _buildName() {
    return TextFactory.buildNormalText2(
      'Lorem Ipsum',
      weight: FontWeights.medium,
    );
  }

  Widget _buildRate() {
    return Row(
      children: [
        const Icon(Icons.star, color: ColorsFactory.rate),
        SizedBox(width: _textMargin),
        TextFactory.buildNormalText3(
          (Random().nextDouble() * 5).toStringAsFixed(1),
        ),
      ],
    );
  }

  Widget _buildBio() {
    return TextFactory.buildNormalText3(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt lectus vel diam maximus, nec molestie ipsum blandit. Vivamus tincidunt tortor eu urna mollis, sed blandit lectus vestibulum. Praesent ac dolor sit amet mi facilisis tincidunt a ut mauris. Nulla cursus sapien velit. Donec quam velit, ultricies non scelerisque sit amet, tincidunt vitae nibh.',
      color: ColorsFactory.secondaryText,
      maxLines: _maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  void _navigate() {}
}
