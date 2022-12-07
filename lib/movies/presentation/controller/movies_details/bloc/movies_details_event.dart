part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesDetailsEvent extends MoviesDetailsEvent {
  final int moviesId;

  const GetMoviesDetailsEvent(this.moviesId);

  @override
  List<Object> get props => [moviesId];
}

class GetMoviesRecommendationsEvent extends MoviesDetailsEvent {
  final int moviesId;

  const GetMoviesRecommendationsEvent(this.moviesId);

  @override
  List<Object> get props => [moviesId];
}
