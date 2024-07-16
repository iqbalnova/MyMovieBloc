import 'package:get_it/get_it.dart';
import 'package:mymoviebloc/config/dio_config.dart';
import 'package:mymoviebloc/data/models/movie/movie_model.dart';

class MovieListServices {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<List<MovieModel>> getMovieNowPlaying() async {
    try {
      final response = await dio.apiGet('/movie/now_playing');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<MovieModel> nowPlayingMovie =
            data.map((movieData) => MovieModel.fromJson(movieData)).toList();

        return nowPlayingMovie;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getMoviePopular() async {
    try {
      final response = await dio.apiGet('/movie/popular');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<MovieModel> popularMovie =
            data.map((movieData) => MovieModel.fromJson(movieData)).toList();

        return popularMovie;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }
}
