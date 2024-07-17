import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/data/models/movie/detail_movie.dart';
import 'package:mymoviebloc/feature/movie_detail/bloc/detail_movie_bloc.dart';
import 'package:mymoviebloc/feature/movie_detail/presentation/widgets/cast_section_widget.dart';
import 'package:mymoviebloc/feature/movie_detail/presentation/widgets/detail_body_section.dart';
import 'package:mymoviebloc/utils/credential.dart';
import 'package:mymoviebloc/utils/styles.dart';

class DetailMovieScreen extends StatefulWidget {
  final int movieId;
  const DetailMovieScreen({super.key, required this.movieId});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailMovieBloc()..add(GetDetailMovieEvent(movieId: widget.movieId)),
      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state is DetailMovieLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is DetailMovieSuccess) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  _renderHeaderSection(detailMovie: state.detailMovie),
                  DetailBodySection(
                    detailMovie: state.detailMovie,
                  ),
                  CastGridSection(
                    movieId: state.detailMovie.id,
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 32,
                    ),
                  )
                ],
              ),
            );
          } else if (state is DetailMovieFailed) {
            return Scaffold(
              body: Center(child: Text(state.error)),
            );
          } else {
            return const Scaffold(body: SizedBox());
          }
        },
      ),
    );
  }

  Widget _renderHeaderSection({required DetailMovieModel detailMovie}) {
    return SliverAppBar(
      foregroundColor: whiteColor,
      // title: Text('TEST'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            size: 32.sp,
          ),
          onPressed: () {},
        ),
      ],
      expandedHeight: 240.h,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Image poster
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${Credential.baseImage}/${detailMovie.backdropPath}',
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
