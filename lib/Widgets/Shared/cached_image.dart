import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/Factories/colors_factory.dart';

class CachedImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CachedImage({
    required this.url,
    this.width,
    this.height,
    this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$url',
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: _buildProgress,
      errorWidget: _buildError,
    );
  }

  Widget _buildProgress(_, __, DownloadProgress downloadProgress) {
    if (Platform.isIOS) {
      return _buildIOSProgressIndicator(downloadProgress);
    }
    return _buildAndroidProgressIndicator(downloadProgress);
  }

  Widget _buildIOSProgressIndicator(DownloadProgress downloadProgress) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _buildAndroidProgressIndicator(DownloadProgress downloadProgress) {
    return Center(
      child: CircularProgressIndicator(
        value: downloadProgress.progress,
        color: ColorsFactory.primary,
      ),
    );
  }

  Widget _buildError(_, __, ___) {
    return Container(
      width: width,
      height: height,
      color: ColorsFactory.secondaryBackground,
      child: const Icon(CupertinoIcons.photo),
    );
  }
}
