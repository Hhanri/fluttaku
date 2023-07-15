import 'package:fluttaku/core/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SearchAnimeTextField extends MyTextFormField {
  final TextEditingController controller;
  final VoidCallback onSearch;
  final Function(String) onFieldSubmitted;
  SearchAnimeTextField({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onFieldSubmitted,
  }) : super(
    parameters: SearchParameters(
      label: "Search anime...",
      controller: controller,
      suffixIcon: IconButton(
        onPressed: onSearch,
        icon: const Icon(Icons.search)
      ),
      onFieldSubmitted: onFieldSubmitted
    )
  );
}