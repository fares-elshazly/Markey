import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Authentication/forgot_password.dart';
import '/Screens/Shared/home.dart';
import '/Screens/Authentication/register.dart';
import '/Widgets/Shared/background.dart';
import '/Widgets/Shared/custom_text_field.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Widgets/Authentication/social_buttons.dart';
import '/Widgets/Authentication/question_navigation.dart';
import '/Resources/strings.dart';
import '/Resources/images.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Utilities/validator.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Authentication/login.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/Login';

  LoginScreen({Key? key}) : super(key: key);

  final _authController = Get.find<AuthenticationController>();

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 20.0;
  final _internalMargin = 15.0;
  final _bottomBarPadding = 15.0;

  final _logoHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFactory.secondaryBackground,
      body: _buildLayout(context),
      bottomNavigationBar: _buildBottomBar(),
    );
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
          SizedBox(height: _bodyVerticalMargin),
          _buildLogo(),
          SizedBox(height: _contentMargin),
          _buildForm(),
          SizedBox(height: _contentMargin * 2),
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
        _buildPasswordField(),
        SizedBox(height: _internalMargin),
        _buildForgotPassword(),
        SizedBox(height: _internalMargin * 2),
        _buildSubmit(),
      ],
    );
  }

  Widget _buildUsernameField() {
    return CustomTextField(
      hint: MRKStrings.loginUsername,
      controller: _usernameController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      hint: MRKStrings.loginPassword,
      controller: _passwordController,
      obscured: true,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildForgotPassword() {
    return InkWell(
      onTap: _forgotPassword,
      child: TextFactory.buildNormalText3(
        MRKStrings.loginForgotPassword,
        weight: FontWeights.medium,
      ),
    );
  }

  Widget _buildSubmit() {
    return SubmitButton(
      label: MRKStrings.loginSubmit,
      behaviour: _submit,
    );
  }

  Widget _buildSocialButtons() {
    return const SocialButtons();
  }

  Widget _buildBottomBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(_bottomBarPadding),
        child: _buildRegister(),
      ),
    );
  }

  Widget _buildRegister() {
    return QuestionNavigation(
      question: MRKStrings.loginDontHaveAccount,
      label: MRKStrings.loginRegister,
      behaviour: _register,
    );
  }

  void _forgotPassword() {
    Get.toNamed(ForgotPasswordScreen.routeName);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateDTO();
      await _authController.login(dto);
      await _authController.getProfile();
      Get.offAllNamed(HomeScreen.routeName);
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  LoginDTO _generateDTO() {
    return LoginDTO(
      email: _usernameController.text,
      password: _passwordController.text,
    );
  }

  void _register() {
    Get.toNamed(RegisterScreen.routeName);
  }
}
