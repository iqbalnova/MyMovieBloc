import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:mymoviebloc/data/models/movie/movie_model.dart';
import 'package:mymoviebloc/data/services/movie_service.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieListServices services = GetIt.instance<MovieListServices>();

  MovieListBloc() : super(MovieListInitial()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      emit(MovieListLoading());

      try {
        final nowPlayingMovie = await services.getMovieNowPlaying();
        emit(MovieListNowPlayingSuccess(nowPlayingMovie: nowPlayingMovie));
      } catch (e) {
        if (e is DioException) {
          emit(MovieListFailed(error: e.response?.data['error']));
          return;
        }
        emit(MovieListFailed(error: e.toString()));
      }
    });

    on<GetPopularMovieEvent>((event, emit) async {
      emit(MovieListLoading());

      try {
        final popularMovie = await services.getMoviePopular();
        emit(MovieListPopularSuccess(popularMovie: popularMovie));
      } catch (e) {
        if (e is DioException) {
          emit(MovieListFailed(error: e.response?.data['error']));
          return;
        }
        emit(MovieListFailed(error: e.toString()));
      }
    });
  }
}
