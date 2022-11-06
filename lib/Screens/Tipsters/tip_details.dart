import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Tips/tip_rate.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Tips/spread_tip.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/tips_controller.dart';

class TipDetailsScreen extends StatefulWidget {
  static const routeName = '/TipDetails';

  const TipDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TipDetailsScreen> createState() => _TipDetailsScreenState();
}

class _TipDetailsScreenState extends State<TipDetailsScreen> {
  bool _isSpreaded = false;

  final _tipController = Get.find<TipsController>();
  final _tip = Get.arguments;

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _bottomBarPadding = 15.0;
  final _contentMargin = 20.0;
  final _borderRadius = 32.0;

  final _textMargin = 4.0;
  final _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(
      title: MRKStrings.tipsTitle,
      backgroundColor: ColorsFactory.background,
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _bodyVerticalMargin),
          _buildTitle(),
          SizedBox(height: _contentMargin),
          _buildTipContent(),
          SizedBox(height: _bodyVerticalMargin),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText1(
      _tip.title,
      weight: FontWeights.medium,
    );
  }

  Widget _buildTipContent() {
    return TextFactory.buildNormalText3(_tip.content);
  }

  Widget _buildBottomBar() {
    return Container(
      decoration: _buildBottomDecoration(),
      padding: EdgeInsets.all(_bottomBarPadding),
      child: SafeArea(child: _buildStats()),
    );
  }

  BoxDecoration _buildBottomDecoration() {
    return BoxDecoration(
      color: ColorsFactory.secondary,
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSpread(),
        _buildRate(),
      ],
    );
  }

  Widget _buildSpread() {
    return InkWell(
      onTap: _spread,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.sync, size: _iconSize, color: _getSpreadColor()),
          SizedBox(width: _textMargin),
          TextFactory.buildNormalText3('${_getSpreadCount()}'),
        ],
      ),
    );
  }

  Widget _buildRate() {
    return InkWell(
      onTap: _rate,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: _iconSize, color: ColorsFactory.rate),
          SizedBox(width: _textMargin),
          TextFactory.buildNormalText3('${_tip.rate}'),
        ],
      ),
    );
  }

  Color _getSpreadColor() {
    if (_isSpreaded) return ColorsFactory.hyperlink;
    return ColorsFactory.tertiaryText;
  }

  int _getSpreadCount() {
    if (_isSpreaded) {
      return _tip.spreadCount + 1;
    }
    return _tip.spreadCount;
  }

  Future<void> _spread() async {
    if (_isSpreaded) return;
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateSpreadDTO();
      await _tipController.spreadTip(dto);
      Get.back();
      setState(() => _isSpreaded = true);
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  SpreadTipDTO _generateSpreadDTO() {
    return SpreadTipDTO(id: _tip.id);
  }

  void _rate() {
    Get.dialog(TipRating(tip: _tip));
  }
}
