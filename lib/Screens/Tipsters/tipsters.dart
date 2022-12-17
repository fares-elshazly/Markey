import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Tipsters/add_tip.dart';
import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/search_field.dart';
import '/Widgets/Tips/tip_card.dart';
import '/Resources/strings.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Utilities/progress_indicator.dart';
import '/DTOs/Shared/pagination.dart';
import '/Models/Tips/tip.dart';
import '/Controllers/tips_controller.dart';

class TipstersScreen extends StatefulWidget {
  static const routeName = '/Tips';

  const TipstersScreen({Key? key}) : super(key: key);

  @override
  State<TipstersScreen> createState() => _TipstersScreenState();
}

class _TipstersScreenState extends State<TipstersScreen> {
  int _currentPage = 1;
  bool _isLoadingMore = false;

  final _tipsController = Get.find<TipsController>();
  final _tipsList = Get.find<TipsController>().tipsList;

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 10.0;
  final _internalMargin = 5.0;

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
      floatingActionButton: _buildFAB(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(
      title: MRKStrings.tipsTitle,
      backgroundColor: ColorsFactory.background,
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: Helpers.dismissKeyboard,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Obx(() => _buildBodyLayout()),
      ),
    );
  }

  Widget _buildBodyLayout() {
    if (_tipsList.value == null) {
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
        // _buildSearch(),
        // SizedBox(height: _contentMargin),
        _buildTips(),
        _buildIsLoadingMore(),
      ],
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: SearchField(),
    );
  }

  Widget _buildTips() {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: _scrollNotify,
        child: _buildTipsContent(),
      ),
    );
  }

  Widget _buildTipsContent() {
    return ListView.separated(
      itemCount: _tipsList.value!.tips.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return _buildTipCard(_tipsList.value!.tips[index]);
      },
    );
  }

  Widget _buildTipCard(Tip tip) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: TipCard(tip: tip),
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

  Widget _buildFAB() {
    return FloatingActionButton(
      backgroundColor: ColorsFactory.primary,
      onPressed: _addTip,
      child: const Icon(Icons.add),
    );
  }

  Future<void> _loadData() async {
    final dto = _generatePaginationDTO();
    await _tipsController.getTipsList(dto);
  }

  PaginationDTO _generatePaginationDTO() {
    return PaginationDTO(page: _currentPage);
  }

  bool _scrollNotify(ScrollNotification scroll) {
    if (_isLoadingMore) return true;
    if (_tipsList.value!.pagination.currentPage >=
        _tipsList.value!.pagination.totalPages) {
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

  void _addTip() {
    Get.toNamed(AddTipScreen.routeName);
  }
}
