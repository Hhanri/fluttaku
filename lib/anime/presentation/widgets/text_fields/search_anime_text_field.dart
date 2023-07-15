import 'package:fluttaku/core/presentation/widgets/text_field.dart';

class SearchAnimeTextField extends MyTextFormField {
  SearchAnimeTextField({
    super.key,
    required super.controller
  }) : super(
    parameters: SearchParameters(
      label: "Search anime..."
    )
  );
}