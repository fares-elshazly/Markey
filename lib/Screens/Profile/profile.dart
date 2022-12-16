import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Profile/add_package.dart';
import '/Screens/Tipsters/add_tip.dart';
import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/avatar.dart';
import '/Widgets/Profile/portfolio.dart';
import '/Widgets/Profile/certificates.dart';
import '/Widgets/Profile/packages.dart';
import '/Widgets/Profile/tips.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/helpers.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Profile/add_previous_work.dart';
import '/DTOs/Profile/add_certificate.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';
import '/Controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/Profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentTab = 0;

  final _authController = Get.find<AuthenticationController>();
  final _profileController = Get.find<ProfileController>();
  final _profile = Get.find<AuthenticationController>().profile;

  final _tabsLength = 4;

  static const _portfolioTabIndex = 0;
  static const _certificatesTabIndex = 1;
  static const _packagesTabIndex = 2;
  static const _tipsTabIndex = 3;

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 15.0;

  final _avatarRadius = 100.0;

  final _viewMargin = 20.0;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsLength,
      child: Scaffold(
        appBar: const BackAppBar(title: MRKStrings.profileTitle),
        body: Obx(() => _buildBody()),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: _buildLayout(),
    );
  }

  Widget _buildLayout() {
    if (_profile.value == null) return _buildLoading();
    return _buildContent();
  }

  Widget _buildLoading() {
    return ProgressIndicators.loadingIndicator();
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfo(),
          SizedBox(height: _contentMargin),
          _buildTabBar(),
          SizedBox(height: _viewMargin),
          _buildView(),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        _buildAvatar(),
        SizedBox(height: _contentMargin),
        _buildName(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Avatar(radius: _avatarRadius, url: _profile.value?.avatar),
        const Icon(Icons.qr_code),
      ],
    );
  }

  Widget _buildName() {
    return TextFactory.buildNormalText1(
      '${_profile.value?.name}',
      weight: FontWeights.medium,
      color: ColorsFactory.primary,
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      onTap: _onTabChange,
      isScrollable: true,
      indicatorColor: ColorsFactory.primary,
      labelStyle: TextFactory.buildStyle(),
      labelColor: ColorsFactory.primary,
      unselectedLabelColor: ColorsFactory.secondaryText,
      tabs: [
        Tab(text: MRKStrings.profilePortfolio.tr),
        Tab(text: MRKStrings.profileCertificates.tr),
        Tab(text: MRKStrings.profilePackages.tr),
        Tab(text: MRKStrings.profileTips.tr),
      ],
    );
  }

  Widget _buildView() {
    switch (_currentTab) {
      case _portfolioTabIndex:
        return Portfolio(previousWorks: _profile.value!.previousWorks);
      case _certificatesTabIndex:
        return Certificates(certificates: _profile.value!.certificates);
      case _packagesTabIndex:
        return Packages(packages: _profile.value!.packages, isCurrentUser: true);
      case _tipsTabIndex:
        return Tips(tips: _profile.value!.tips);
      default:
        return const SizedBox();
    }
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      backgroundColor: ColorsFactory.primary,
      onPressed: _add,
      child: const Icon(Icons.add),
    );
  }

  Future<void> _loadData() async {
    await _authController.getProfile();
  }

  void _onTabChange(int index) {
    if (index == _currentTab) return;
    setState(() => _currentTab = index);
  }

  Future<void> _add() async {
    switch (_currentTab) {
      case _portfolioTabIndex:
        return await _addPreviousWork();
      case _certificatesTabIndex:
        return await _addCertificate();
      case _packagesTabIndex:
        return _addPackage();
      case _tipsTabIndex:
        return _addTip();
      default:
    }
  }

  Future<void> _addPreviousWork() async {
    ProgressIndicators.loadingDialog();
    try {
      final dto = await _generatePreviousWorkDTO();
      if (dto == null) return Get.back();
      await _profileController.addPreviousWork(dto);
      await _authController.getProfile();
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  Future<AddPreviousWorkDTO?> _generatePreviousWorkDTO() async {
    final image = await Helpers.selectImage();
    if (image == null) return null;
    return AddPreviousWorkDTO(image: image.path, userId: _profile.value!.id);
  }

  Future<void> _addCertificate() async {
    ProgressIndicators.loadingDialog();
    try {
      final dto = await _generateCertificateDTO();
      if (dto == null) return Get.back();
      await _profileController.addCertificate(dto);
      await _authController.getProfile();
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  Future<AddCertificateDTO?> _generateCertificateDTO() async {
    final image = await Helpers.selectImage();
    if (image == null) return null;
    return AddCertificateDTO(image: image.path, userId: _profile.value!.id);
  }

  void _addPackage() {
    Get.toNamed(AddPackageScreen.routeName);
  }

  void _addTip() {
    Get.toNamed(AddTipScreen.routeName);
  }
}
