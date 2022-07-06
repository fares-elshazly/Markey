import 'package:flutter/material.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback behaviour;

  const SubmitButton({
    required this.label,
    required this.behaviour,
    Key? key,
  }) : super(key: key);

  final _padding = 7.5;
  final _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: behaviour,
      style: _buildStyle(context),
      child: _buildContent(),
    );
  }

  ButtonStyle _buildStyle(BuildContext context) {
    return TextButton.styleFrom(
      primary: ColorsFactory.secondary,
      backgroundColor: ColorsFactory.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: _buildLabel(),
    );
  }

  Widget _buildLabel() {
    return TextFactory.buildNormalText3(
      label,
      weight: FontWeights.medium,
      color: ColorsFactory.secondary,
    );
  }
}
