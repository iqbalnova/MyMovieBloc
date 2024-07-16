part of 'movie_list_bloc.dart';

sealed class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class RefreshGetListMovieEvent extends MovieListEvent {}

class GetNowPlayingMovieEvent extends MovieListEvent {}

class GetPopularMovieEvent extends MovieListEvent {}
