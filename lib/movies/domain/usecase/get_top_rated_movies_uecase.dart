import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUecase extends BaseUseCase<List<Movies>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return baseMoviesRepository.getTopRatedMovies();
  }
}
