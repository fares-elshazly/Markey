import 'package:flutter/material.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/search_field.dart';
import '/Widgets/Community/business_card.dart';
import '/Resources/strings.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';

class CommunityScreen extends StatelessWidget {
  static const routeName = '/Community';

  const CommunityScreen({Key? key}) : super(key: key);

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 10.0;
  final _internalMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(
      title: MRKStrings.communityTitle,
      backgroundColor: ColorsFactory.background,
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
    return Column(
      children: [
        _buildSearch(),
        SizedBox(height: _contentMargin),
        _buildBusinesses(),
      ],
    );
  }

  Widget _buildSearch() {
    return SearchField();
  }

  Widget _buildBusinesses() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _buildBusinessCard(index);
        },
      ),
    );
  }

  Widget _buildBusinessCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: BusinessCard(index: index),
    );
  }
}
