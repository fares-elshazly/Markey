import 'package:flutter/material.dart';

import '/Widgets/Home/home_drawer.dart';
import '/Widgets/Home/greeting.dart';
import '/Widgets/Home/service_card.dart';
import '/Widgets/Home/active_project_tile.dart';
import '/Widgets/Home/home_bottom_bar.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/Home';

  const HomeScreen({Key? key}) : super(key: key);

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 30.0;
  final _internalMargin = 10.0;

  final _serviceHeight = 200.0;
  final _servicesMargin = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      body: _buildBody(context),
      bottomNavigationBar: const HomeBottomBar(),
      floatingActionButton: const HomeFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: SafeArea(child: _buildContent()),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: _bodyVerticalMargin),
          const Greeting(),
          SizedBox(height: _contentMargin),
          _buildServices(),
          SizedBox(height: _contentMargin),
          _buildActiveProjects(),
          SizedBox(height: _bodyVerticalMargin),
        ],
      ),
    );
  }

  Widget _buildServices() {
    return SizedBox(
      height: _serviceHeight,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _buildServiceCard(index);
        },
      ),
    );
  }

  Widget _buildServiceCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _servicesMargin),
      child: ServiceCard(index: index),
    );
  }

  Widget _buildActiveProjects() {
    return Column(
      children: [
        _buildActiveProjectsHeader(),
        SizedBox(height: _internalMargin),
        _buildProjects(),
      ],
    );
  }

  Widget _buildActiveProjectsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActiveProjectsTitle(),
        SizedBox(width: _contentMargin),
        _buildActiveProjectsViewAll(),
      ],
    );
  }

  Widget _buildActiveProjectsTitle() {
    return TextFactory.buildNormalText2(
      MRKStrings.homeActiveProjects,
    );
  }

  Widget _buildActiveProjectsViewAll() {
    return InkWell(
      child: TextFactory.buildNormalText2(
        MRKStrings.sharedViewAll,
        color: ColorsFactory.hyperlink,
      ),
    );
  }

  Widget _buildProjects() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, __) => const ActiveProjectTile(),
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
