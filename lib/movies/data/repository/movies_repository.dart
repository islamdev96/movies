// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movies_details.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/movies/domain/entities/recommmendation.dart';

import '../../domain/entities/movies.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecase/get_movies_details_usecase.dart';
import '../datasource/movie_remote_date_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDateSource baseMovieRemoteDateSource;

  MoviesRepository(this.baseMovieRemoteDateSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayerMovies() async {
    final result = await baseMovieRemoteDateSource.getNowPlayerMovies();

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMovieRemoteDateSource.getPopularMovies();

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDateSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MoviesDetailsParameters parameters) async {
    final result = await baseMovieRemoteDateSource.getMoviesDetails(parameters);

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDateSource.getRecommendations(parameters);

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
