import 'package:fluttaku/core/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SearchAnimeTextField extends MyTextFormField {
  final TextEditingController controller;
  SearchAnimeTextField({
    super.key,
    required this.controller
  }) : super(
    parameters: SearchParameters(
      label: "Search anime...",
      controller: controller
    )
  );
}