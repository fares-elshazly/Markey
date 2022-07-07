import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? label;
  final TextEditingController controller;
  final int? maxLines;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final bool enabled;
  final bool obscured;
  final Widget? suffix;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.hint,
    required this.controller,
    this.label,
    this.maxLines = 1,
    this.borderRadius = 8.0,
    this.borderColor = ColorsFactory.field,
    this.backgroundColor = ColorsFactory.secondary,
    this.enabled = true,
    this.obscured = false,
    this.suffix,
    this.keyboard,
    this.formatters,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  final _internalMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    if (widget.label == null) return _buildField();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        SizedBox(height: _internalMargin),
        _buildField(),
      ],
    );
  }

  Widget _buildField() {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      obscureText: widget.obscured ? _isObscured : false,
      validator: widget.validator,
      keyboardType: widget.keyboard,
      inputFormatters: widget.formatters,
      style: _buildTextStyle(),
      decoration: _buildDecoration(context),
    );
  }

  TextStyle _buildTextStyle() {
    return TextFactory.buildStyle(color: ColorsFactory.secondaryText);
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.hint.tr,
      hintStyle: _buildTextStyle(),
      filled: true,
      fillColor: widget.backgroundColor,
      enabledBorder: _buildBorder(widget.borderColor),
      disabledBorder: _buildBorder(widget.borderColor),
      focusedBorder: _buildBorder(widget.borderColor),
      errorBorder: _buildBorder(ColorsFactory.danger),
      focusedErrorBorder: _buildBorder(ColorsFactory.danger),
      suffixIcon: widget.suffix ?? _buildObscureButton(),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
  }

  Widget? _buildObscureButton() {
    if (!widget.obscured) return null;
    return IconButton(
      icon: _getObscureIcon(),
      onPressed: () => setState(() => _isObscured = !_isObscured),
    );
  }

  Widget _getObscureIcon() {
    if (_isObscured) return const Icon(CupertinoIcons.eye_slash);
    return const Icon(CupertinoIcons.eye);
  }

  Widget _buildLabel() {
    return TextFactory.buildNormalText3(
      widget.label!,
      color: ColorsFactory.secondaryText,
    );
  }
}
