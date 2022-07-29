import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  final _borderRadius = 8.0;
  final _iconPadding = 10.0;
  final _maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ColorsFactory.secondary,
      shape: _buildShape(),
      leading: _buildIcon(),
      title: _buildTitle(),
      subtitle: _buildBody(),
      trailing: _buildDateTime(),
    );
  }

  ShapeBorder _buildShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: EdgeInsets.all(_iconPadding),
      decoration: _buildIconDecoration(),
      child: const Icon(
        CupertinoIcons.bell,
        color: ColorsFactory.secondary,
      ),
    );
  }

  BoxDecoration _buildIconDecoration() {
    return BoxDecoration(
      color: ColorsFactory.primary,
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText3(
      'Lorem Ipsum',
      weight: FontWeights.medium,
    );
  }

  Widget _buildBody() {
    return TextFactory.buildNormalText4(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt lectus vel diam maximus, nec molestie ipsum blandit.',
      color: ColorsFactory.secondaryText,
      maxLines: _maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDateTime() {
    return TextFactory.buildNormalText4(
      Helpers.previewDateTime(_generateDateTime()),
    );
  }

  DateTime _generateDateTime() {
    final randomHours = Random().nextInt(48);
    final randomDuration = Duration(hours: randomHours);
    return DateTime.now().subtract(randomDuration);
  }
}
