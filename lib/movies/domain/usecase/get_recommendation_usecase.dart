import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/recommmendation.dart';

import '../repository/base_movies_repository.dart';

class GetMoviesRecommendationUsecase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int recommendationId;

  const RecommendationParameters(this.recommendationId);

  @override
  List<Object?> get props => [recommendationId];
}
