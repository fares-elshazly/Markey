import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Shared/home.dart';
import '/Screens/Authentication/login.dart';
import '/Resources/images.dart';
import '/Factories/colors_factory.dart';
import '/Controllers/authentication_controller.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/Splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authController = Get.find<AuthenticationController>();

  final _bodyHorizontalMargin = 15.0;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFactory.secondaryBackground,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
        child: _buildLogo(),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Image.asset(
        MRKImages.logo,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Future<void> _loadData() async {
    final isLoggedIn = await _loadUser();
    _navigate(isLoggedIn);
  }

  Future<bool> _loadUser() async {
    final isLoggedIn = await _authController.checkLoggedIn();
    return isLoggedIn;
  }

  Future<void> _navigate(bool isLoggedIn) async {
    if (isLoggedIn) return Get.offNamed(HomeScreen.routeName);
    return Get.offNamed(LoginScreen.routeName);
  }
}
