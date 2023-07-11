abstract class AnimeEpisodeStreamingSourceEntity {
  final String url;
  final bool isM3U8;
  final String quality;

  AnimeEpisodeStreamingSourceEntity({
    required this.url,
    required this.isM3U8,
    required this.quality
  });
}