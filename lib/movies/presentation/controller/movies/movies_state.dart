import 'package:equatable/equatable.dart';

import '../../../../core/utils/enun.dart';
import '../../../domain/entities/movies.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestStatus nowPlayingState;
  final String nowPlayingMessage;
  final List<Movies> popularMovies;
  final RequestStatus popularState;
  final String popularMessage;
  final List<Movies> topRatedMovies;
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
    List<Movies>? topRatedMovies,
    RequestStatus? topRatedState,
    String? topRatedMessage,
    List<Movies>? popularMovies,
    RequestStatus? popularState,
    String? popularMessage,
    List<Movies>? nowPlayingMovies,
    RequestStatus? nowPlayingState,
    String? nowPlayingMessage,
  }) {
    return MoviesState(
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
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
