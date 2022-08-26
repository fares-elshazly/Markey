import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Authentication/reset_password.dart';
import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/background.dart';
import '/Widgets/Shared/custom_text_field.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Utilities/validator.dart';

class VerifyCodeScreen extends StatelessWidget {
  static const routeName = '/VerifyCode';

  VerifyCodeScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 20.0;
  final _internalMargin = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFactory.secondaryBackground,
      appBar: _buildAppBar(),
      body: _buildLayout(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(title: MRKStrings.verifyCodeTitle);
  }

  Widget _buildLayout(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        _buildBody(context),
      ],
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
      child: Column(
        children: [
          SizedBox(height: _bodyVerticalMargin * 2),
          _buildSubtitle(),
          SizedBox(height: _contentMargin),
          _buildForm(),
          SizedBox(height: _bodyVerticalMargin),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return TextFactory.buildNormalText2(
      MRKStrings.verifyCodeSubtitle,
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: _buildFormContent(),
    );
  }

  Widget _buildFormContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildCodeField(),
        SizedBox(height: _internalMargin),
        _buildResend(),
        SizedBox(height: _internalMargin),
        _buildSubmit(),
      ],
    );
  }

  Widget _buildCodeField() {
    return CustomTextField(
      hint: MRKStrings.verifyCodeCode,
      controller: _codeController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildResend() {
    return InkWell(
      onTap: _resend,
      child: TextFactory.buildNormalText3(
        MRKStrings.verifyCodeResend,
        weight: FontWeights.medium,
      ),
    );
  }

  Widget _buildSubmit() {
    return SubmitButton(
      label: MRKStrings.verifyCodeSubmit,
      behaviour: _submit,
    );
  }

  void _resend() {}

  void _submit() {
    Get.toNamed(ResetPasswordScreen.routeName);
  }
}
