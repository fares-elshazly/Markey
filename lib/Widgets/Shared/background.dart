import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/Resources/icons.dart';

class Background extends StatelessWidget {
  final double opacity;

  const Background({this.opacity = 0.1, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: _buildImage(context),
    );
  }

  Widget _buildImage(BuildContext context) {
    return SvgPicture.asset(
      MRKIcons.background,
      width: MediaQuery.of(context).size.width,
    );
  }
}
