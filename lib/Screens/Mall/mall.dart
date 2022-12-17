import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Mall/expert_card.dart';
import '/Resources/strings.dart';
import '/Utilities/progress_indicator.dart';
import '/DTOs/Shared/pagination.dart';
import '/Controllers/services_controller.dart';

class MallScreen extends StatefulWidget {
  static const routeName = '/Mall';

  const MallScreen({super.key});

  @override
  State<MallScreen> createState() => _MallScreenState();
}

class _MallScreenState extends State<MallScreen> {
  int _currentPage = 1;
  bool _isLoadingMore = false;

  final _dto = Get.arguments;

  final _servicesController = Get.find<ServicesController>();
  final _expertsList = Get.find<ServicesController>().expertsList;

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 10.0;

  final _expertsCrossAxisCount = 2;
  final _expertsMainAxisSpacing = 20.0;
  final _expertsCrossAxisSpacing = 10.0;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: MRKStrings.mallTitle),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: Obx(() => _buildBodyLayout()),
    );
  }

  Widget _buildBodyLayout() {
    if (_expertsList.value == null) {
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
        _buildExperts(),
        _buildIsLoadingMore(),
      ],
    );
  }

  Widget _buildExperts() {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: _scrollNotify,
        child: _buildExpertsList(),
      ),
    );
  }

  Widget _buildExpertsList() {
    return AlignedGridView.count(
      itemCount: _expertsList.value?.experts.length,
      crossAxisCount: _expertsCrossAxisCount,
      mainAxisSpacing: _expertsMainAxisSpacing,
      crossAxisSpacing: _expertsCrossAxisSpacing,
      itemBuilder: (BuildContext context, int index) {
        final expert = _expertsList.value!.experts[index];
        return ExpertCard(expert: expert);
      },
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
    final paginationDto = _generatePaginationDTO();
    await _servicesController.getExpertsList(_dto, paginationDto);
  }

  PaginationDTO _generatePaginationDTO() {
    return PaginationDTO(page: _currentPage);
  }

  bool _scrollNotify(ScrollNotification scroll) {
    if (_isLoadingMore) return true;
    if (_expertsList.value!.pagination.currentPage >=
        _expertsList.value!.pagination.totalPages) {
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
