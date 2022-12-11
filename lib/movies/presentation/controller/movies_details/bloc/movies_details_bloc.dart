import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/entities/movies_details.dart';
import 'package:movies/movies/domain/entities/recommmendation.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_usecase.dart';

import '../../../../../core/utils/enun.dart';
import '../../../../domain/usecase/get_recommendation_usecase.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMoviesDetailsUseCase, this.getRecommendationUsecase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMoviesDetails);

    on<GetMoviesRecommendationsEvent>(_getMoviesRecommendations);
  }
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;

  final GetMoviesRecommendationUsecase getRecommendationUsecase;

  FutureOr<void> _getMoviesDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getMoviesDetailsUseCase(MoviesDetailsParameters(event.moviesId));
    result.fold(
      (l) => emit(
        state.copyWith(
          moviesDetailsState: RequestStatus.error,
          moviesDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          moviesDetails: r,
          moviesDetailsState: RequestStatus.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMoviesRecommendations(GetMoviesRecommendationsEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result = await getRecommendationUsecase(
        RecommendationParameters(event.moviesId));
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationsState: RequestStatus.error,
          recommendationsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendations: r,
          recommendationsState: RequestStatus.loaded,
        ),
      ),
    );
  }
}
