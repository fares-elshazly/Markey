import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/Widgets/Shared/cached_image.dart';
import '/Models/Profile/certificate.dart';

class Certificates extends StatelessWidget {
  final List<Certificate> certificates;

  const Certificates({required this.certificates, Key? key}) : super(key: key);

  final _crossAxisCount = 2;
  final _mainAxisSpacing = 10.0;
  final _crossAxisSpacing = 10.0;

  final _borderRadius = 8.0;
  final _imageHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: certificates.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: _crossAxisCount,
      mainAxisSpacing: _mainAxisSpacing,
      crossAxisSpacing: _crossAxisSpacing,
      itemBuilder: (BuildContext context, int index) {
        return _buildImage(certificates[index]);
      },
    );
  }

  Widget _buildImage(Certificate certificate) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: CachedImage(
        url: certificate.image,
        width: double.infinity,
        height: _imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
