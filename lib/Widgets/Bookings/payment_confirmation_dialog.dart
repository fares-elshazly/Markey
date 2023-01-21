import 'package:flutter/material.dart';

import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class PaymentConfirmationDialog extends StatelessWidget {
  final bool isSuccess;

  const PaymentConfirmationDialog({required this.isSuccess, super.key});

  final _iconSize = 60.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildIcon(),
      content: _buildDescription(),
    );
  }

  Widget _buildIcon() {
    if (isSuccess) return _buildSuccessIcon();
    return _buildFailIcon();
  }

  Widget _buildSuccessIcon() {
    return Icon(
      Icons.check_circle,
      size: _iconSize,
      color: ColorsFactory.success,
    );
  }

  Widget _buildFailIcon() {
    return Icon(
      Icons.cancel_outlined,
      size: _iconSize,
      color: ColorsFactory.danger,
    );
  }

  Widget _buildDescription() {
    if (isSuccess) return _buildSuccessDescription();
    return _buildFailDescription();
  }

  Widget _buildSuccessDescription() {
    return TextFactory.buildNormalText1(
      MRKStrings.paymentConfirmationSuccess,
      color: ColorsFactory.success,
      align: TextAlign.center,
    );
  }

  Widget _buildFailDescription() {
    return TextFactory.buildNormalText1(
      MRKStrings.paymentConfirmationFail,
      color: ColorsFactory.danger,
      align: TextAlign.center,
    );
  }
}
