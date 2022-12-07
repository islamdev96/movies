import '../../domain/entities/movies.dart';

class MovieModel extends Movies {
  const MovieModel({
    required int id,
    required String title,
    required String backdropPath,
    required List<int> genreIds,
    required String overview,
    required double voteAverage,
    required String releaseDate,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          genreIds: genreIds,
          overview: overview,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      // genreIds: json['genre_ids'].cast<int>(),

      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'overview': overview,
      'vote_average': voteAverage,
      'release_date': releaseDate,
    };
  }
}
