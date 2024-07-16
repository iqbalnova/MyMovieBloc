part of 'movie_list_bloc.dart';

sealed class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

final class MovieListInitial extends MovieListState {}

final class MovieListLoading extends MovieListState {}

final class MovieListFailed extends MovieListState {
  final String error;

  const MovieListFailed({required this.error});

  @override
  List<Object> get props => [error];
}

final class MovieListPopularSuccess extends MovieListState {
  final List<MovieModel> popularMovie;

  const MovieListPopularSuccess({required this.popularMovie});

  @override
  List<Object> get props => [popularMovie];
}

final class MovieListNowPlayingSuccess extends MovieListState {
  final List<MovieModel> nowPlayingMovie;

  const MovieListNowPlayingSuccess({required this.nowPlayingMovie});

  @override
  List<Object> get props => [nowPlayingMovie];
}
