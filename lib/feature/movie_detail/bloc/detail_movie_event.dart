part of 'detail_movie_bloc.dart';

sealed class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovieEvent extends DetailMovieEvent {
  final int movieId;

  const GetDetailMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
