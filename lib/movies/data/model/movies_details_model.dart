import 'package:movies/movies/data/model/genres_model.dart';
import 'package:movies/movies/domain/entities/movies_details.dart';

import '../../domain/entities/genres.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel({
    required String title,
    required List<Genres> genres,
    required String overview,
    required String backdropPath,
    required String releaseDate,
    required double voteAverage,
    required int runtime,
    required int id,
  }) : super(
          genres,
          title: title,
          overview: overview,
          backdropPath: backdropPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          runtime: runtime,
          id: id,
        );

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    return MoviesDetailsModel(
      title: json['title'],
      genres:
          (json['genres'] as List).map((e) => GenresModel.fromJson(e)).toList(),
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      runtime: json['runtime'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'genres': genres,
      'overview': overview,
      'backdrop_path': backdropPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'runtime': runtime,
      'id': id,
    };
  }
}
