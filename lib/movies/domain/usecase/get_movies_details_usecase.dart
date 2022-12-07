import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movies_details.dart';

import '../repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase
    extends BaseUseCase<MoviesDetails, MoviesDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesDetails>> call(
      MoviesDetailsParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int moviesId;

  const MoviesDetailsParameters(this.moviesId);

  @override
  List<Object?> get props => [moviesId];
}
