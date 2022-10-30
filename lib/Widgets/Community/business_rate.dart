import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '/Widgets/Shared/avatar.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Community/rate_community.dart';
import '/Models/Community/community.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/community_controller.dart';

class BusinessRating extends StatelessWidget {
  final Community community;

  BusinessRating({required this.community, super.key});

  final _communityController = Get.find<CommunityController>();

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      image: _buildImage(),
      title: _buildTitle(),
      message: _buildDescription(),
      submitButtonText: MRKStrings.businessRatingSubmit.tr,
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
      MRKStrings.businessRatingTitle,
      weight: FontWeights.medium,
      align: TextAlign.center,
      args: [community.title],
    );
  }

  Text _buildDescription() {
    return TextFactory.buildNormalText4(
      MRKStrings.businessRatingDescription,
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
      await _communityController.rateCommunity(dto);
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  RateCommunityDTO _generateDTO(RatingDialogResponse response) {
    return RateCommunityDTO(
      rate: response.rating.toInt(),
      communityId: community.id,
    );
  }
}
