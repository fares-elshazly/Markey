import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/avatar.dart';
import '/Widgets/Profile/qr_dialog.dart';
import '/Widgets/Profile/portfolio.dart';
import '/Widgets/Profile/certificates.dart';
import '/Widgets/Profile/packages.dart';
import '/Widgets/Profile/tips.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Controllers/profile_controller.dart';

class ExpertProfileScreen extends StatefulWidget {
  static const routeName = '/ExpertProfile';

  final int expertId;

  const ExpertProfileScreen({required this.expertId, Key? key}) : super(key: key);

  @override
  State<ExpertProfileScreen> createState() => _ExpertProfileScreenState();
}

class _ExpertProfileScreenState extends State<ExpertProfileScreen> {
  int _currentTab = 0;

  final _profileController = Get.find<ProfileController>();
  final _profile = Get.find<ProfileController>().expert;

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
        SizedBox(height: _contentMargin / 2),
        _buildUsername(),
      ],
    );
  }

  Widget _buildAvatar() {
    return InkWell(
      onTap: _showQr,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Avatar(radius: _avatarRadius, url: _profile.value?.avatar),
          const Icon(Icons.qr_code),
        ],
      ),
    );
  }

  Widget _buildName() {
    return TextFactory.buildNormalText1(
      '${_profile.value?.name}',
      weight: FontWeights.medium,
      color: ColorsFactory.primary,
    );
  }

  Widget _buildUsername() {
    return TextFactory.buildNormalText2(
      '@${_profile.value?.username}',
      color: ColorsFactory.hyperlink,
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

  Future<void> _loadData() async {
    await _profileController.getExpertProfile(widget.expertId);
  }

  void _showQr() {
    Get.dialog(QRDialog(id: _profile.value!.id));
  }

  void _onTabChange(int index) {
    if (index == _currentTab) return;
    setState(() => _currentTab = index);
  }
}
