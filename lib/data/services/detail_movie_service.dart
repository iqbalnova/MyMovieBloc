import 'package:get_it/get_it.dart';
import 'package:mymoviebloc/config/dio_config.dart';
import 'package:mymoviebloc/data/models/movie/detail_movie.dart';

class DetailMovieService {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<DetailMovieModel> getMovieNowPlaying() async {
    try {
      final response = await dio.apiGet('/movie/now_playing');

      if (response.statusCode == 200) {
        final DetailMovieModel movieDetail = DetailMovieModel.fromJson(
          response.data,
        );

        return movieDetail;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }
}
