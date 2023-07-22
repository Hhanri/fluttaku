abstract class EpisodeStreamingSourceEntity {
  final String url;
  final bool isM3U8;
  final String quality;

  EpisodeStreamingSourceEntity({
    required this.url,
    required this.isM3U8,
    required this.quality
  });
}