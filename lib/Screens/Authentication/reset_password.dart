import 'package:flutter/material.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/custom_text_field.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Resources/strings.dart';
import '/Utilities/helpers.dart';
import '/Utilities/validator.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = '/ResetPassword';

  ResetPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _internalMargin = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(title: MRKStrings.resetPasswordTitle);
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
          _buildForm(),
          SizedBox(height: _bodyVerticalMargin),
        ],
      ),
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
        _buildPasswordField(),
        SizedBox(height: _internalMargin),
        _buildConfirmPasswordField(),
        SizedBox(height: _internalMargin * 2),
        _buildSubmit(),
      ],
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      hint: MRKStrings.resetPasswordNewPassword,
      controller: _passwordController,
      obscured: true,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextField(
      hint: MRKStrings.resetPasswordConfirmNewPassword,
      controller: _confirmPasswordController,
      obscured: true,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildSubmit() {
    return SubmitButton(
      label: MRKStrings.resetPasswordSubmit,
      behaviour: _submit,
    );
  }

  void _submit() {}
}
