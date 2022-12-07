import 'package:movies/core/network/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:movies/movies/data/model/movies_details_model.dart';

import 'package:movies/movies/data/model/movies_model.dart';
import 'package:movies/movies/data/model/recommendation_model.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/utils/app_constance.dart';
import '../../domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDateSource {
  Future<List<MovieModel>> getNowPlayerMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters parameters);
}

// Path: lib\movies\data\datasource\movie_remote_date_source.dart

class MovieRemoteDateSource implements BaseMovieRemoteDateSource {
  @override
  Future<List<MovieModel>> getNowPlayerMovies() async {
    final response = await Dio().get(ApiConstance.getNowPlayingPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return Future.error(ServirException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  //////////////////////

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.getPopularPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return Future.error(ServirException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

//////////////////////
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.getTopRatedPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return Future.error(ServirException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.getMovieDetailsPath(parameters.moviesId));

    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromJson(response.data);
    } else {
      return Future.error(ServirException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters parameters) async {
    final response = await Dio()
        .get(ApiConstance.getRecommendationPath(parameters.recommendationId));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return Future.error(ServirException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }
}
