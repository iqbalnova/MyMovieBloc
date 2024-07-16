import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/data/models/movie/movie_model.dart';
import 'package:mymoviebloc/feature/core/presentation/widgets/custom_button.dart';
import 'package:mymoviebloc/feature/movie/bloc/movie_list_bloc.dart';
import 'package:mymoviebloc/feature/movie/presentation/widgets/genre_section_widget.dart';
import 'package:mymoviebloc/utils/credential.dart';
import 'package:mymoviebloc/utils/styles.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        BlocProvider(
          create: (context) => MovieListBloc()..add(GetPopularMovieEvent()),
          child: BlocBuilder<MovieListBloc, MovieListState>(
            builder: (context, state) {
              if (state is MovieListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieListPopularSuccess) {
                return _popularTile(
                  dataPopularMovie: state.popularMovie,
                  onTap: (movieId) {
                    if (kDebugMode) {
                      print(movieId);
                    }
                  },
                );
              } else if (state is MovieListFailed) {
                return Center(child: Text(state.error));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular",
            style: blackTextStyle.merge(
              boldStyle,
            ),
          ),
          SizedBox(
            width: 100,
            child: CustomButton(
              onTap: () {},
              label: "See more",
              isOutlineButton: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _popularTile({
    required List<MovieModel> dataPopularMovie,
    required Function(int) onTap,
  }) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataPopularMovie.length,
        itemBuilder: (context, index) {
          final popularMovie = dataPopularMovie[index];
          return InkWell(
            onTap: () {
              onTap(popularMovie.id);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 85.w,
                    height: 120.h,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        '${Credential.baseImage}/${popularMovie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          popularMovie.title,
                          style: blackTextStyle.merge(semiBoldStyle),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: yellowColor, size: 16.sp),
                          SizedBox(width: 4.w),
                          Text(
                            '${popularMovie.voteAverage.toStringAsFixed(2)}/10',
                            style: blackTextStyle.copyWith(color: greyColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        width: 220,
                        child: GenreSectionWidget(
                          genreIds: popularMovie.genreIds,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
