import 'package:flutter/material.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class ActiveProjectTile extends StatelessWidget {
  const ActiveProjectTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _buildTitle(),
      subtitle: _buildDetails(),
      trailing: _buildPrice(),
    );
  }

  Widget _buildTitle() {
    return TextFactory.buildNormalText3(
      'Logo Design',
      weight: FontWeights.medium,
    );
  }

  Widget _buildDetails() {
    return TextFactory.buildNormalText4(
      'For: Jack Sparrow',
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildPrice() {
    return TextFactory.buildNormalText4('500 EGP');
  }
}
