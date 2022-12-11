part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetails? moviesDetails;
  final RequestStatus moviesDetailsState;
  final String moviesDetailsMessage;
  final List<Recommendation> recommendations;
  final RequestStatus recommendationsState;
  final String recommendationsMessage;

  const MoviesDetailsState({
    this.recommendations = const [],
    this.recommendationsState = RequestStatus.loading,
    this.recommendationsMessage = '',
    this.moviesDetails,
    this.moviesDetailsState = RequestStatus.loading,
    this.moviesDetailsMessage = '',
  });

  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestStatus? moviesDetailsState,
    String? moviesDetailsMessage,
    List<Recommendation>? recommendations,
    RequestStatus? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MoviesDetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsState,
        moviesDetailsMessage,
        recommendations,
        recommendationsState,
        recommendationsMessage,
      ];
}
