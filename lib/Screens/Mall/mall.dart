import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/search_field.dart';
import '/Widgets/Mall/service_card.dart';
import '/Widgets/Mall/shop_card.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';

class MallScreen extends StatelessWidget {
  static const routeName = '/Mall';

  const MallScreen({Key? key}) : super(key: key);

  final _tabsLength = 2;

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 10.0;
  final _viewMargin = 20.0;

  final _servicesCrossAxisCount = 2;
  final _servicesMainAxisSpacing = 20.0;
  final _servicesCrossAxisSpacing = 10.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsLength,
      child: Scaffold(
        appBar: const BackAppBar(title: MRKStrings.mallTitle),
        body: _buildBody(context),
      ),
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
        _buildTabBar(),
        SizedBox(height: _viewMargin),
        _buildView(),
      ],
    );
  }

  Widget _buildSearch() {
    return SearchField();
  }

  Widget _buildTabBar() {
    return TabBar(
      indicatorColor: ColorsFactory.primary,
      labelStyle: TextFactory.buildStyle(),
      labelColor: ColorsFactory.primary,
      unselectedLabelColor: ColorsFactory.secondaryText,
      tabs: [
        Tab(text: MRKStrings.mallServices.tr),
        Tab(text: MRKStrings.mallShops.tr),
      ],
    );
  }

  Widget _buildView() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildServices(),
          _buildShops(),
        ],
      ),
    );
  }

  Widget _buildServices() {
    return AlignedGridView.count(
      itemCount: 20,
      crossAxisCount: _servicesCrossAxisCount,
      mainAxisSpacing: _servicesMainAxisSpacing,
      crossAxisSpacing: _servicesCrossAxisSpacing,
      itemBuilder: (BuildContext context, int index) {
        return ServiceCard(index: index);
      },
    );
  }

  Widget _buildShops() {
    return AlignedGridView.count(
      itemCount: 20,
      crossAxisCount: _servicesCrossAxisCount,
      mainAxisSpacing: _servicesMainAxisSpacing,
      crossAxisSpacing: _servicesCrossAxisSpacing,
      itemBuilder: (BuildContext context, int index) {
        return ShopCard(index: index);
      },
    );
  }
}
