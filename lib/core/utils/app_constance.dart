class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "6650eb4eef036cb8da0cb91364c252f4";

  static const String getNowPlayingPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String getPopularPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String getTopRatedPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String getMovieDetailsPath(int moviesId) =>
      "$baseUrl/movie/$moviesId?api_key=$apiKey";

  static String getRecommendationPath(int moviesId) =>
      "$baseUrl/movie/$moviesId/recommendations?api_key=$apiKey  ";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) {
    return "$baseImageUrl$path";
  }
}
