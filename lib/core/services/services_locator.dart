import 'package:get_it/get_it.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_uecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies_uecase.dart';
import 'package:movies/movies/presentation/controller/movies_details/bloc/movies_details_bloc.dart';

import '../../movies/data/datasource/movie_remote_date_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/usecase/get_now_player_movies_uecase.dart';
import '../../movies/domain/usecase/get_recommendation_usecase.dart';
import '../../movies/presentation/controller/movies/movies_block.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));
    //UseCase
    sl.registerLazySingleton(() => GetNowPlayerMoviesUecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUecase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesRecommendationUsecase(sl()));

    // Repositories

    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    // DATA SOURCES
    sl.registerLazySingleton<BaseMovieRemoteDateSource>(
        () => MovieRemoteDateSource());
  }
}
