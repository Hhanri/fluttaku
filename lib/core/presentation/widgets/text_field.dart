import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends TextFormField {
  final TextFormParameters parameters;
  MyTextFormField({
    super.key,
    required this.parameters,
    super.controller,
  }) : super(
    maxLines: parameters.maxLines,
    onTap: parameters.onTap,
    inputFormatters: parameters.inputFormatters,
    textCapitalization: parameters.textCapitalization,
    validator: parameters.validator,
    readOnly: parameters.readOnly,
    keyboardType: parameters.keyboardType,
    decoration: InputDecoration(
      labelText: parameters.label,
      errorText: parameters.errorText,
      border: OutlineInputBorder(
        borderRadius: MyTheme.bigBorderRadius,
        borderSide: const BorderSide(color: MyColors.primaryColor, width: 1)
      )
    )
  );

}

abstract class TextFormParameters {
  final String label;
  final String? errorText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;
  final bool readOnly;
  TextFormParameters({
    required this.label,
    this.errorText,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.readOnly = false
  });
}

class SearchParameters extends TextFormParameters {
  SearchParameters({
    required super.label,
    super.errorText,

  }) : super(
    readOnly: false,
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.none,
    onTap: null,
    maxLines: 1,
    validator: null,
    inputFormatters: null
  );
}

class ButtonParameters extends TextFormParameters {
  ButtonParameters({
    required super.onTap,
    required super.label,
  }) : super(
    readOnly: false,
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.none,
    maxLines: 1,
    validator: null,
    inputFormatters: null,
    errorText: null,
  );
}