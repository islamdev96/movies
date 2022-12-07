// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_uecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies_uecase.dart';
import 'package:movies/movies/presentation/controller/movies/movies_event.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/enun.dart';
import '../../../domain/usecase/get_now_player_movies_uecase.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayerMoviesUecase getNowPlayerMoviesUecase;
  final GetPopularMoviesUecase getPopularMoviesUecase;
  final GetTopRatedMoviesUecase getTopRatedMoviesUecase;
  // final GetPopular
  MoviesBloc(this.getNowPlayerMoviesUecase, this.getPopularMoviesUecase,
      this.getTopRatedMoviesUecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayerMoviesUecase(const NoParameters());
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
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUecase(const NoParameters());
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
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUecase(const NoParameters());
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
  }
}
