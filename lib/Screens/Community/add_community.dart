import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/custom_text_field.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Resources/strings.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Utilities/validator.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Community/add_community.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/community_controller.dart';

class AddCommunityScreen extends StatelessWidget {
  static const routeName = '/AddCommunity';

  AddCommunityScreen({super.key});

  final _communityController = Get.find<CommunityController>();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _offerController = TextEditingController();

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 30.0;
  final _maxLines = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildSubmit(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(
      title: MRKStrings.communityTitle,
      backgroundColor: ColorsFactory.background,
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      onTap: Helpers.dismissKeyboard,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: _bodyVerticalMargin),
            _buildNameField(),
            SizedBox(height: _contentMargin),
            _buildSubTitleField(),
            SizedBox(height: _contentMargin),
            _buildDescriptionField(),
            SizedBox(height: _contentMargin),
            _buildOfferField(),
            SizedBox(height: _bodyVerticalMargin),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return CustomTextField(
      label: MRKStrings.addCommunityName,
      hint: MRKStrings.addCommunityName,
      controller: _nameController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildSubTitleField() {
    return CustomTextField(
      label: MRKStrings.addCommunitySubtitle,
      hint: MRKStrings.addCommunitySubtitle,
      controller: _subtitleController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildDescriptionField() {
    return CustomTextField(
      label: MRKStrings.addCommunityDescription,
      hint: MRKStrings.addCommunityDescription,
      controller: _descriptionController,
      maxLines: _maxLines,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildOfferField() {
    return CustomTextField(
      label: MRKStrings.addCommunityOffer,
      hint: MRKStrings.addCommunityOffer,
      controller: _offerController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildSubmit() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(_bodyHorizontalMargin),
        child: _buildSubmitButton(),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SubmitButton(
      label: MRKStrings.addCommunitySubmit,
      behaviour: _submit,
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateDTO();
      await _communityController.addCommunity(dto);
      Get.back();
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  AddCommunityDTO _generateDTO() {
    return AddCommunityDTO(
      title: _nameController.text,
      subtitle: _subtitleController.text,
      description: _descriptionController.text,
      offer: _offerController.text,
    );
  }
}
