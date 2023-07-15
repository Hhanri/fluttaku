import 'package:fluttaku/core/config/router.dart';
import 'package:fluttaku/core/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeSearchButton extends MyTextFormField {
  HomeSearchButton({super.key}) : super(
    parameters: ButtonParameters(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          FocusManager.instance.primaryFocus?.unfocus();
        });
        GoRouter.of(MyGoRouter.context).pushNamed(MyGoRouter.searchRouteName);
      },
      label: "Search anime...",
      suffixIcon: const Icon(Icons.search)
    )
  );
}