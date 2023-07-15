import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends Padding {
  final TextFormParameters parameters;

  MyTextFormField({
    super.key,
    required this.parameters
  }) : super(
    padding: MyTheme.defaultPadding,
    child: TextFormField(
      controller: parameters.controller,
      maxLines: parameters.maxLines,
      onTap: parameters.onTap,
      inputFormatters: parameters.inputFormatters,
      textCapitalization: parameters.textCapitalization,
      validator: parameters.validator,
      readOnly: parameters.readOnly,
      keyboardType: parameters.keyboardType,
      enabled: parameters.enabled,
      onFieldSubmitted: parameters.onFieldSubmitted,
      autofocus: parameters.autofocus,
      decoration: InputDecoration(
        contentPadding: MyTheme.smallPadding,
        suffixIcon: parameters.suffixIcon,
        labelText: parameters.labelText,
        hintText: parameters.hintText,
        errorText: parameters.errorText,
        border: OutlineInputBorder(
          borderRadius: MyTheme.bigBorderRadius,
          borderSide: const BorderSide(color: MyColors.primaryColor, width: 1)
        )
      )
    )
  );
}

abstract class TextFormParameters {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool enabled;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;
  final bool autofocus;
  TextFormParameters({
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.autofocus = false
  });
}

class SearchParameters extends TextFormParameters {
  SearchParameters({
    required super.controller,
    required super.hintText,
    required super.suffixIcon,
    required super.onFieldSubmitted,
    super.errorText,
  }) : super(
    readOnly: false,
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.none,
    onTap: null,
    maxLines: 1,
    validator: null,
    inputFormatters: null,
    autofocus: true
  );
}

class ButtonParameters extends TextFormParameters {
  ButtonParameters({
    required super.onTap,
    required super.hintText,
    required super.suffixIcon,
  }) : super(
    readOnly: true,
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.none,
    maxLines: 1,
    validator: null,
    inputFormatters: null,
    errorText: null,
  );
}