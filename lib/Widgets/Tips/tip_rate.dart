import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '/Widgets/Shared/avatar.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Tips/rate_tip.dart';
import '/Models/Tips/tip.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/tips_controller.dart';

class TipRating extends StatelessWidget {
  final Tip tip;

  TipRating({required this.tip, super.key});

  final _tipController = Get.find<TipsController>();

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      image: _buildImage(),
      title: _buildTitle(),
      message: _buildDescription(),
      submitButtonText: MRKStrings.tipRatingSubmit.tr,
      submitButtonTextStyle: _buildSubmitStyle(),
      enableComment: false,
      onSubmitted: _submit,
    );
  }

  Widget _buildImage() {
    return const Avatar(radius: 100);
  }

  Text _buildTitle() {
    return TextFactory.buildNormalText2(
      MRKStrings.tipRatingTitle,
      weight: FontWeights.medium,
      align: TextAlign.center,
      args: [tip.title],
    );
  }

  Text _buildDescription() {
    return TextFactory.buildNormalText4(
      MRKStrings.tipRatingDescription,
      align: TextAlign.center,
    );
  }

  TextStyle _buildSubmitStyle() {
    return TextFactory.buildStyle(
      weight: FontWeights.semiBold,
      color: ColorsFactory.primary,
    );
  }

  Future<void> _submit(RatingDialogResponse response) async {
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateDTO(response);
      await _tipController.rateTip(dto);
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  RateTipDTO _generateDTO(RatingDialogResponse response) {
    return RateTipDTO(
      id: tip.id,
      rate: response.rating.toInt(),
    );
  }
}
