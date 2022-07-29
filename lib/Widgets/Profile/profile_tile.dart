import 'package:flutter/material.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback behavior;

  const ProfileTile({
    required this.icon,
    required this.title,
    required this.behavior,
    Key? key,
  }) : super(key: key);

  final _borderRadius = 8.0;
  final _iconPadding = 7.0;
  final _arrowSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: behavior,
      tileColor: ColorsFactory.secondary,
      shape: _buildShape(),
      leading: _buildIcon(),
      title: _buildTitle(),
      trailing: _buildArrow(),
    );
  }

  ShapeBorder _buildShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: EdgeInsets.all(_iconPadding),
      decoration: _buildIconDecoration(),
      child: Icon(icon, color: ColorsFactory.secondary),
    );
  }

  BoxDecoration _buildIconDecoration() {
    return BoxDecoration(
      color: ColorsFactory.primary,
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText3(
      title,
      weight: FontWeights.medium,
    );
  }

  Widget _buildArrow() {
    return Icon(Icons.arrow_forward_ios, size: _arrowSize);
  }
}
