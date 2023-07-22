abstract class EpisodeInfoEntity {
  final String id;
  final String? title;
  final String? description;
  final int number;
  final String thumbnail;

  EpisodeInfoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.number,
    required this.thumbnail
  });
}