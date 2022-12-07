part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetails? moviesDetails;
  final RequestStatus moviesDetailsState;
  final String moviesDetailsMessage;

  const MoviesDetailsState({
    this.moviesDetails,
    this.moviesDetailsState = RequestStatus.loading,
    this.moviesDetailsMessage = '',
  });

  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestStatus? moviesDetailsState,
    String? moviesDetailsMessage,
  }) {
    return MoviesDetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
    );
  }

  @override
  List<Object> get props => [
        moviesDetails!,
        moviesDetailsState,
        moviesDetailsMessage,
      ];
}
