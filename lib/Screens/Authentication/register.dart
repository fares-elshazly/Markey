import 'package:flutter/material.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/background.dart';
import '/Widgets/Shared/custom_text_field.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Widgets/Authentication/social_buttons.dart';
import '/Resources/strings.dart';
import '/Resources/images.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Utilities/validator.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/Register';

  RegisterScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 20.0;
  final _internalMargin = 15.0;

  final _logoHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFactory.secondaryBackground,
      appBar: _buildAppBar(),
      body: _buildLayout(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(title: MRKStrings.registerTitle);
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
          _buildLogo(),
          SizedBox(height: _contentMargin),
          _buildForm(),
          SizedBox(height: _contentMargin * 1.5),
          _buildSocialButtons(),
          SizedBox(height: _bodyVerticalMargin),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      MRKImages.logo,
      height: _logoHeight,
      fit: BoxFit.scaleDown,
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
        _buildUsernameField(),
        SizedBox(height: _internalMargin),
        _buildNameField(),
        SizedBox(height: _internalMargin),
        _buildPasswordField(),
        SizedBox(height: _internalMargin),
        _buildConfirmPasswordField(),
        SizedBox(height: _internalMargin * 2),
        _buildSubmit(),
      ],
    );
  }

  Widget _buildUsernameField() {
    return CustomTextField(
      hint: MRKStrings.registerUsername,
      controller: _usernameController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildNameField() {
    return CustomTextField(
      hint: MRKStrings.registerName,
      controller: _nameController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      hint: MRKStrings.registerPassword,
      controller: _passwordController,
      obscured: true,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextField(
      hint: MRKStrings.registerConfirmPassword,
      controller: _confirmPasswordController,
      obscured: true,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildSubmit() {
    return SubmitButton(
      label: MRKStrings.registerSubmit,
      behaviour: _submit,
    );
  }

  Widget _buildSocialButtons() {
    return const SocialButtons();
  }

  void _submit() {}
}
