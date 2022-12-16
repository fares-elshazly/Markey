import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '/DTOs/Profile/add_package.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';
import '/Controllers/profile_controller.dart';

class AddPackageScreen extends StatelessWidget {
  static const routeName = '/AddPackage';

  AddPackageScreen({super.key});

  final _authController = Get.find<AuthenticationController>();
  final _profileController = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _durationController = TextEditingController();

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
      title: MRKStrings.addPackageTitle,
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
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: _bodyVerticalMargin),
        _buildTitleField(),
        SizedBox(height: _contentMargin),
        _buildDescriptionField(),
        SizedBox(height: _contentMargin),
        _buildCostField(),
        SizedBox(height: _contentMargin),
        _buildDurationField(),
        SizedBox(height: _bodyVerticalMargin),
      ],
    );
  }

  Widget _buildTitleField() {
    return CustomTextField(
      label: MRKStrings.addPackageSubtitle,
      hint: MRKStrings.addPackageSubtitle,
      controller: _titleController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildDescriptionField() {
    return CustomTextField(
      label: MRKStrings.addPackageDescription,
      hint: MRKStrings.addPackageDescription,
      controller: _descriptionController,
      maxLines: _maxLines,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildCostField() {
    return CustomTextField(
      label: MRKStrings.addPackageCost,
      hint: MRKStrings.addPackageCost,
      controller: _costController,
      validator: Validator.isNotEmpty,
      keyboard: TextInputType.number,
      formatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  Widget _buildDurationField() {
    return CustomTextField(
      label: MRKStrings.addPackageDuration,
      hint: MRKStrings.addPackageDuration,
      controller: _durationController,
      validator: Validator.isNotEmpty,
      keyboard: TextInputType.number,
      formatters: [FilteringTextInputFormatter.digitsOnly],
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
      label: MRKStrings.addTipSubmit,
      behaviour: _submit,
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateDTO();
      await _profileController.addPackage(dto);
      await _authController.getProfile();
      Get.back();
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  AddPackageDTO _generateDTO() {
    return AddPackageDTO(
      title: _titleController.text,
      description: _descriptionController.text,
      cost: double.parse(_costController.text),
      duration: int.parse(_durationController.text),
      userId: _authController.profile.value!.id,
    );
  }
}
