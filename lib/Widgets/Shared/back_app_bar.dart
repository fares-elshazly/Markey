import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color foregroundColor;

  const BackAppBar({
    required this.title,
    this.backgroundColor,
    this.foregroundColor = ColorsFactory.secondary,
    Key? key,
  }) : super(key: key);

  final _height = 60.0;
  final _elevation = 0.0;

  @override
  Size get preferredSize => Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: _elevation,
      leading: _buildBack(),
      title: _buildTitle(),
    );
  }

  Widget _buildBack() {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: foregroundColor),
      onPressed: () => Get.back(),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText1(
      title,
      color: foregroundColor,
    );
  }
}