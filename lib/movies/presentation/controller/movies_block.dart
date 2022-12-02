// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_uecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies_uecase.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';

import '../../../core/utils/enun.dart';
import '../../domain/usecase/get_now_player_movies_uecase.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayerMoviesUecase getNowPlayerMoviesUecase;
  final GetPopularMoviesUecase getPopularMoviesUecase;
  final GetTopRatedMoviesUecase getTopRatedMoviesUecase;
  // final GetPopular
  MoviesBloc(this.getNowPlayerMoviesUecase, this.getPopularMoviesUecase,
      this.getTopRatedMoviesUecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayerMoviesUecase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            nowPlayingState: RequestStatus.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestStatus.loaded,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUecase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            popularState: RequestStatus.error,
            popularMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            popularMovies: r,
            popularState: RequestStatus.loaded,
          ),
        ),
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUecase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            topRatedState: RequestStatus.error,
            topRatedMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedState: RequestStatus.loaded,
          ),
        ),
      );
    });
  }
}
