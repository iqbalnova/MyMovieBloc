import 'package:get_it/get_it.dart';
import 'package:mymoviebloc/config/dio_config.dart';
import 'package:mymoviebloc/data/services/movie_service.dart';
import 'package:mymoviebloc/routes/app_router.dart';

class Locator {
  static final getIt = GetIt.instance;

  void setupDepedencyInjection() {
    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerSingleton<ApiClient>(ApiClient());
    getIt.registerSingleton<MovieListServices>(MovieListServices());
  }
}
