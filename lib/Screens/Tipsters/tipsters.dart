import 'package:flutter/material.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/search_field.dart';
import '/Widgets/Tips/tip_card.dart';
import '/Resources/strings.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';

class TipstersScreen extends StatelessWidget {
  static const routeName = '/Tips';

  const TipstersScreen({Key? key}) : super(key: key);

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 10.0;
  final _internalMargin = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(
      title: MRKStrings.tipsTitle,
      backgroundColor: ColorsFactory.background,
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      onTap: Helpers.dismissKeyboard,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildSearch(),
        SizedBox(height: _contentMargin),
        _buildTips(),
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
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return _buildTipCard(index);
        },
      ),
    );
  }

  Widget _buildTipCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: TipCard(index: index),
    );
  }
}
