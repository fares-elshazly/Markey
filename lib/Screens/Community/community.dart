import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/search_field.dart';
import '/Widgets/Community/business_card.dart';
import '/Resources/strings.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Utilities/progress_indicator.dart';
import '/DTOs/Shared/pagination.dart';
import '/Models/Community/community.dart';
import '/Controllers/community_controller.dart';

class CommunityScreen extends StatefulWidget {
  static const routeName = '/Community';

  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _currentPage = 1;
  bool _isLoadingMore = false;

  final _communityController = Get.find<CommunityController>();
  final _communityList = Get.find<CommunityController>().communityList;

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 10.0;
  final _internalMargin = 10.0;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(
      title: MRKStrings.communityTitle,
      backgroundColor: ColorsFactory.background,
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: Helpers.dismissKeyboard,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
        child: Obx(() => _buildBodyLayout()),
      ),
    );
  }

  Widget _buildBodyLayout() {
    if (_communityList.value == null) {
      return _buildLoading();
    }
    return _buildContent();
  }

  Widget _buildLoading() {
    return ProgressIndicators.loadingIndicator();
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildSearch(),
        SizedBox(height: _contentMargin),
        _buildBusinesses(),
        _buildIsLoadingMore(),
      ],
    );
  }

  Widget _buildSearch() {
    return SearchField();
  }

  Widget _buildBusinesses() {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: _scrollNotify,
        child: _buildBusinessesContent(),
      ),
    );
  }

  Widget _buildBusinessesContent() {
    return ListView.builder(
      itemCount: _communityList.value?.communities.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildBusinessCard(_communityList.value!.communities[index]);
      },
    );
  }

  Widget _buildBusinessCard(Community community) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: BusinessCard(community: community),
    );
  }

  Widget _buildIsLoadingMore() {
    return Visibility(
      visible: _isLoadingMore,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: _contentMargin),
        child: ProgressIndicators.loadingIndicator(),
      ),
    );
  }

  Future<void> _loadData() async {
    final dto = _generatePaginationDTO();
    await _communityController.getCommunityList(dto);
  }

  PaginationDTO _generatePaginationDTO() {
    return PaginationDTO(page: _currentPage);
  }

  bool _scrollNotify(ScrollNotification scroll) {
    if (_isLoadingMore) return true;
    if (_communityList.value!.pagination.currentPage >=
        _communityList.value!.pagination.totalPages) {
      return true;
    }
    if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
      _loadMore();
    }
    return true;
  }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);
    _currentPage++;
    await _loadData();
    setState(() => _isLoadingMore = false);
  }
}
