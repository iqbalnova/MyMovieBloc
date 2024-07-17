import 'package:get_it/get_it.dart';
import 'package:mymoviebloc/config/dio_config.dart';
import 'package:mymoviebloc/data/models/cast/cast_model.dart';
import 'package:mymoviebloc/data/models/movie/detail_movie.dart';

class DetailMovieService {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<DetailMovieModel> getDetailMovie({required int movieId}) async {
    try {
      final response = await dio.apiGet('/movie/$movieId');

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

  Future<List<CastModel>> getAllCast({required int movieId}) async {
    try {
      final response = await dio.apiGet('/movie/$movieId/credits');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['cast'];
        List<CastModel> castRes =
            data.map((movieData) => CastModel.fromJson(movieData)).toList();

        return castRes;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }
}
