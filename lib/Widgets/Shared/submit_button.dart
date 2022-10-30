import 'package:flutter/material.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback behaviour;
  final bool isEnabled;

  const SubmitButton({
    required this.label,
    required this.behaviour,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  final _height = 50.0;
  final _padding = 15.0;
  final _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? behaviour : null,
      style: _buildStyle(context),
      child: _buildContent(context),
    );
  }

  ButtonStyle _buildStyle(BuildContext context) {
    return TextButton.styleFrom(
      padding: EdgeInsets.zero,
      foregroundColor: ColorsFactory.secondary,
      backgroundColor: ColorsFactory.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Ink(
      width: MediaQuery.of(context).size.width,
      height: _height,
      padding: EdgeInsets.all(_padding),
      decoration: _buildDecoration(),
      child: Center(child: _buildLabel()),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: isEnabled ? null : ColorsFactory.disabled,
      borderRadius: BorderRadius.circular(_borderRadius),
      gradient: isEnabled ? _buildGradient() : null,
    );
  }

  LinearGradient _buildGradient() {
    return const LinearGradient(
      colors: [ColorsFactory.gradientTop, ColorsFactory.gradientBottom],
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
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
