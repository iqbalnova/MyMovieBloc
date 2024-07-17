import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mymoviebloc/data/models/movie/detail_movie.dart';
import 'package:mymoviebloc/data/services/detail_movie_service.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final DetailMovieService services = GetIt.instance<DetailMovieService>();

  DetailMovieBloc() : super(DetailMovieInitial()) {
    on<GetDetailMovieEvent>((event, emit) async {
      emit(DetailMovieLoading());

      try {
        final detailMovieRes =
            await services.getDetailMovie(movieId: event.movieId);
        emit(DetailMovieSuccess(detailMovie: detailMovieRes));
      } catch (e) {
        if (e is DioException) {
          emit(DetailMovieFailed(error: e.response?.data['error']));
          return;
        }
        emit(DetailMovieFailed(error: e.toString()));
      }
    });
  }
}
