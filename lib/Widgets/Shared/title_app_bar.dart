import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/Factories/text_factory.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TitleAppBar({required this.title, Key? key}) : super(key: key);

  final _height = 60.0;
  final _elevation = 0.0;

  @override
  Size get preferredSize => Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: _elevation,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: _buildTitle(),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildTitle1(
      title,
      weight: FontWeights.semiBold,
    );
  }
}
