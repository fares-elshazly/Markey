import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/submit_button.dart';
import '/Widgets/Community/business_rate.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Models/Community/community.dart';

class BusinessCard extends StatelessWidget {
  final Community community;

  const BusinessCard({required this.community, Key? key}) : super(key: key);

  final _borderRadius = 8.0;
  final _padding = 10.0;
  final _contentMargin = 10.0;
  final _internalMargin = 5.0;
  final _textMargin = 4.0;
  final _buttonPadding = 60.0;

  final _headerHeight = 6.0;
  final _iconSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildDecoration(),
      child: _buildBody(),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: ColorsFactory.secondary,
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildHeader(),
        _buildContent(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      height: _headerHeight,
      decoration: _buildHeaderDecoration(),
    );
  }

  BoxDecoration _buildHeaderDecoration() {
    return BoxDecoration(
      color: ColorsFactory.primary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_borderRadius),
        topRight: Radius.circular(_borderRadius),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: _buildContentDetails(),
    );
  }

  Widget _buildContentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfo(),
        SizedBox(height: _contentMargin),
        _buildAbout(),
        SizedBox(height: _contentMargin),
        _buildOffer(),
        SizedBox(height: _contentMargin),
        _buildReview()
      ],
    );
  }

  Widget _buildInfo() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: _buildName(),
      subtitle: _buildInfoDetails(),
    );
  }

  Widget _buildName() {
    return TextFactory.buildNormalText2(
      community.title,
      weight: FontWeights.medium,
    );
  }

  Widget _buildInfoDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildType(),
        _buildRate(),
      ],
    );
  }

  Widget _buildType() {
    return TextFactory.buildNormalText4(
      community.subtitle,
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildRate() {
    return Row(
      children: [
        Icon(Icons.star, size: _iconSize, color: ColorsFactory.rate),
        SizedBox(width: _textMargin),
        TextFactory.buildNormalText4('${community.rate}'),
      ],
    );
  }

  Widget _buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(MRKStrings.businessCardAbout),
        SizedBox(height: _internalMargin),
        _buildAboutContent(),
      ],
    );
  }

  Widget _buildAboutContent() {
    return TextFactory.buildNormalText4(community.description);
  }

  Widget _buildOffer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(MRKStrings.businessCardOffer),
        SizedBox(height: _internalMargin),
        _buildOfferContent(),
      ],
    );
  }

  Widget _buildOfferContent() {
    return TextFactory.buildNormalText4(community.offer);
  }

  Widget _buildReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(MRKStrings.businessCardReviewTitle),
        SizedBox(height: _contentMargin),
        _buildReviewSubmit(),
      ],
    );
  }

  Widget _buildReviewSubmit() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _buttonPadding),
      child: SubmitButton(
        label: MRKStrings.businessCardReviewSubmit,
        behaviour: _submitReview,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return TextFactory.buildNormalText3(
      title,
      weight: FontWeights.medium,
      color: ColorsFactory.primary,
    );
  }

  void _submitReview() {
    Get.dialog(BusinessRating(community: community));
  }
}
