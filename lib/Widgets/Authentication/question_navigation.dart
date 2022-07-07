import 'package:flutter/material.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class QuestionNavigation extends StatelessWidget {
  final String question;
  final String label;
  final VoidCallback behaviour;

  const QuestionNavigation({
    required this.question,
    required this.label,
    required this.behaviour,
    Key? key,
  }) : super(key: key);

  final _margin = 5.0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: _margin,
      alignment: WrapAlignment.center,
      children: [
        _buildQuestion(),
        _buildLabel(),
      ],
    );
  }

  Widget _buildQuestion() {
    return TextFactory.buildNormalText3(question);
  }

  Widget _buildLabel() {
    return InkWell(
      onTap: behaviour,
      child: _buildLabelContent(),
    );
  }

  Widget _buildLabelContent() {
    return TextFactory.buildNormalText3(
      label,
      weight: FontWeights.medium,
      color: ColorsFactory.hyperlink,
    );
  }
}
