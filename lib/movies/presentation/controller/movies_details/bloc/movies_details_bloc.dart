import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/entities/movies_details.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_usecase.dart';

import '../../../../../core/utils/enun.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMoviesDetailsUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMoviesDetails);
  }
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;

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
}
