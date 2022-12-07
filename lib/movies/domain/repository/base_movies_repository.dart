import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/recommmendation.dart';

import '../../../core/error/failure.dart';
import '../entities/movies.dart';
import '../entities/movies_details.dart';
import '../usecase/get_movies_details_usecase.dart';
import '../usecase/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayerMovies();
  Future<Either<Failure, List<Movies>>> getPopularMovies();
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MoviesDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameters parameters);
}
