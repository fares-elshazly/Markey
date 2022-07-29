import 'package:flutter/material.dart';

import '/Widgets/Shared/title_app_bar.dart';
import '/Widgets/Notifications/notification_tile.dart';
import '/Resources/strings.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/Notifications';

  const NotificationsScreen({Key? key}) : super(key: key);

  final _bodyHorizontalMargin = 15.0;
  final _internalMargin = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const TitleAppBar(title: MRKStrings.notificationsTitle);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return _buildNotificationTile();
      },
    );
  }

  Widget _buildNotificationTile() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: const NotificationTile(),
    );
  }
}
