import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/Resources/icons.dart';
import '/Factories/colors_factory.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  final _internalMargin = 15.0;
  final _buttonPadding = 12.0;
  final _iconSize = 28.0;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: _buildButtons(),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          MRKIcons.google,
          _submit,
        ),
        SizedBox(width: _internalMargin),
        _buildSocialButton(
          MRKIcons.apple,
          _submit,
        ),
        SizedBox(width: _internalMargin),
        _buildSocialButton(
          MRKIcons.facebook,
          _submit,
        ),
        SizedBox(width: _internalMargin),
        _buildSocialButton(
          MRKIcons.instagram,
          _submit,
        ),
        SizedBox(width: _internalMargin),
        _buildSocialButton(
          MRKIcons.twitter,
          _submit,
        ),
      ],
    );
  }

  Widget _buildSocialButton(String iconPath, VoidCallback behaviour) {
    return OutlinedButton(
      onPressed: behaviour,
      style: _buildSocialButtonStyle(),
      child: SvgPicture.asset(iconPath, width: _iconSize),
    );
  }

  ButtonStyle _buildSocialButtonStyle() {
    return OutlinedButton.styleFrom(
      padding: EdgeInsets.all(_buttonPadding),
      shape: const CircleBorder(),
      side: const BorderSide(color: ColorsFactory.field),
    );
  }

  Future<void> _submit() async {}
}
