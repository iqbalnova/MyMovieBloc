import 'package:flutter/material.dart';
import 'package:mymoviebloc/feature/core/presentation/screens/main_screen.dart';
import 'package:mymoviebloc/feature/core/presentation/screens/splash_screen.dart';
import 'package:mymoviebloc/feature/movie_detail/presentation/screens/detail_movie.dart';
import 'package:mymoviebloc/routes/app_routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Builder(
        builder: (BuildContext context) {
          switch (settings.name) {
            case AppRoutes.splash:
              return const SplashScreen();
            case AppRoutes.main:
              return const MainScreen();
            case AppRoutes.detailMovie:
              final Map<String, dynamic> arguments =
                  settings.arguments as Map<String, dynamic>;
              final int movieId = arguments['movieId'];
              return DetailMovieScreen(
                movieId: movieId,
              );
            default:
              return const Scaffold(
                body: Center(
                  child: Text(
                    'Check Named Routes',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              );
          }
        },
      );
    });
  }
}
