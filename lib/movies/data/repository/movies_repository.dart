// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../datasource/movie_remote_date_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDateSource baseMovieRemoteDateSource;

  MoviesRepository(this.baseMovieRemoteDateSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayerMovies() async {
    final result = await baseMovieRemoteDateSource.getNowPlayerMovies();

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDateSource.getPopularMovies();

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDateSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServirException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
