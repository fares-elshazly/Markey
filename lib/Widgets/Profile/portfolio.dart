import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/Resources/images.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  final _crossAxisCount = 2;
  final _mainAxisSpacing = 20.0;
  final _crossAxisSpacing = 10.0;

  final _borderRadius = 8.0;
  final _imageHeight = 200.0;

  final _images = const [
    MRKImages.shop1,
    MRKImages.shop2,
    MRKImages.shop3,
    MRKImages.shop4,
    MRKImages.shop5,
  ];

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: _crossAxisCount,
      mainAxisSpacing: _mainAxisSpacing,
      crossAxisSpacing: _crossAxisSpacing,
      itemBuilder: (BuildContext context, int index) {
        return _buildImage(index);
      },
    );
  }

  Widget _buildImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Image.asset(
        _images[index % _images.length],
        width: double.infinity,
        height: _imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
