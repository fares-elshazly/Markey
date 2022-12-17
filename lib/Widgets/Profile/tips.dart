import 'package:flutter/material.dart';

import '/Widgets/Tips/tip_card.dart';
import '/Models/Tips/tip.dart';

class Tips extends StatelessWidget {
  final List<Tip> tips;

  const Tips({required this.tips, Key? key}) : super(key: key);

  final _internalMargin = 5.0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tips.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildTipCard(tips[index]);
      },
    );
  }

  Widget _buildTipCard(Tip tip) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: TipCard(tip: tip),
    );
  }
}
