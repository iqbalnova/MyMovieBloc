part of 'detail_movie_bloc.dart';

sealed class DetailMovieState extends Equatable {
  const DetailMovieState();
  
  @override
  List<Object> get props => [];
}

final class DetailMovieInitial extends DetailMovieState {}
