import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/genres.dart';

class MoviesDetails extends Equatable {
  final String title;
  final List<Genres> genres;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int runtime;
  final int id;

  const MoviesDetails(
    this.genres, {
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
    required this.id,
  });

  @override
  List<Object> get props => [
        title,
        genres,
        overview,
        backdropPath,
        releaseDate,
        voteAverage,
        runtime,
        id,
      ];
}
