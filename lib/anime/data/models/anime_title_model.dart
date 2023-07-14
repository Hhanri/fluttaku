import 'package:fluttaku/anime/domain/entities/anime_title_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeTitleModel extends AnimeTitleEntity {
  AnimeTitleModel({
    required super.romaji,
    required super.english,
    required super.native
  });

  factory AnimeTitleModel.formJson(Map<String, dynamic> json) {
    return AnimeTitleModel(
      romaji: json[AnimeDTOConstants.romaji],
      english: json[AnimeDTOConstants.english],
      native: json[AnimeDTOConstants.native]
    );
  }
}