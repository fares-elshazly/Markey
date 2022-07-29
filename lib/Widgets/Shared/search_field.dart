import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/Widgets/Shared/custom_text_field.dart';
import '/Resources/strings.dart';

class SearchField extends StatelessWidget {
  final Future<void> Function()? behavior;

  SearchField({this.behavior, Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: MRKStrings.sharedSearch,
      controller: _controller,
      suffix: _buildButton(),
    );
  }

  Widget _buildButton() {
    return IconButton(
      icon: const Icon(CupertinoIcons.search),
      onPressed: behavior,
    );
  }
}
