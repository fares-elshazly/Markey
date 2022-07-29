import 'package:flutter/material.dart';

import '/Widgets/Shared/title_app_bar.dart';
import '/Widgets/Shared/search_field.dart';
import '/Widgets/Chat/conversation_tile.dart';
import '/Resources/strings.dart';
import '/Utilities/helpers.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/Chat';

  const ChatScreen({Key? key}) : super(key: key);

  final _bodyHorizontalMargin = 15.0;
  final _contentMargin = 15.0;
  final _internalMargin = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const TitleAppBar(title: MRKStrings.chatTitle);
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
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearch(),
          SizedBox(height: _contentMargin),
          _buildConversations(),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return SearchField();
  }

  Widget _buildConversations() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildConversationTile(index);
      },
    );
  }

  Widget _buildConversationTile(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: ConversationTile(index: index),
    );
  }
}
