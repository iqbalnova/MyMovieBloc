part of 'detail_movie_bloc.dart';

sealed class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

final class DetailMovieInitial extends DetailMovieState {}

final class DetailMovieLoading extends DetailMovieState {}

final class DetailMovieFailed extends DetailMovieState {
  final String error;

  const DetailMovieFailed({required this.error});

  @override
  List<Object> get props => [error];
}

final class DetailMovieSuccess extends DetailMovieState {
  final DetailMovieModel detailMovie;

  const DetailMovieSuccess({required this.detailMovie});

  @override
  List<Object> get props => [detailMovie];
}

final class CastSuccess extends DetailMovieState {
  final List<CastModel> castData;

  const CastSuccess({required this.castData});

  @override
  List<Object> get props => [castData];
}
