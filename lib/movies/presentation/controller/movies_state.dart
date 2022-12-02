import 'package:equatable/equatable.dart';

import '../../../core/utils/enun.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestStatus nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestStatus popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestStatus topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.popularMovies = const [],
    this.popularState = RequestStatus.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestStatus.loading,
    this.topRatedMessage = '',
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestStatus.loading,
    this.nowPlayingMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? popularMovies,
    RequestStatus? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestStatus? topRatedState,
    String? topRatedMessage,
    List<Movie>? nowPlayingMovies,
    RequestStatus? nowPlayingState,
    String? nowPlayingMessage,
  }) {
    return MoviesState(
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage
      ];
}
