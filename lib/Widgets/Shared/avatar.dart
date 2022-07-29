import 'package:flutter/material.dart';

import '/Widgets/Shared/cached_image.dart';
import '/Resources/images.dart';

class Avatar extends StatelessWidget {
  final String? url;
  final double radius;

  const Avatar({this.url, this.radius = 60.0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius,
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    if (url == null) return _buildPlaceholder();
    return _buildNetworkImage();
  }

  Widget _buildPlaceholder() {
    return Image.asset(MRKImages.avatar, fit: BoxFit.cover);
  }

  Widget _buildNetworkImage() {
    return ClipOval(
      child: CachedImage(url: url, fit: BoxFit.cover),
    );
  }
}
