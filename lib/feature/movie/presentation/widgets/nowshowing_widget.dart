import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/data/models/movie/movie_model.dart';
import 'package:mymoviebloc/feature/core/presentation/widgets/custom_button.dart';
import 'package:mymoviebloc/feature/movie/bloc/movie_list_bloc.dart';
import 'package:mymoviebloc/routes/app_routes.dart';
import 'package:mymoviebloc/utils/credential.dart';
import 'package:mymoviebloc/utils/styles.dart';

class NowShowingSection extends StatelessWidget {
  const NowShowingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        BlocProvider(
          create: (context) => MovieListBloc()..add(GetNowPlayingMovieEvent()),
          child: BlocBuilder<MovieListBloc, MovieListState>(
            builder: (context, state) {
              if (state is MovieListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieListNowPlayingSuccess) {
                return _buildHorizontalListView(
                  dataNowShowing: state.nowPlayingMovie,
                  onTap: (movieId) {
                    Navigator.pushNamed(context, AppRoutes.detailMovie,
                        arguments: {'movieId': movieId});
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
            "Now Showing",
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

  Widget _buildHorizontalListView({
    required List<MovieModel> dataNowShowing,
    required Function(int) onTap,
  }) {
    return Container(
      height: 320.h,
      color: whiteColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataNowShowing.length,
        itemBuilder: (context, index) {
          final nowShowing = dataNowShowing[index];
          final bool isLastIndex = index == dataNowShowing.length - 1;
          return InkWell(
            onTap: () {
              onTap(nowShowing.id);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: isLastIndex ? 16 : 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 140.w,
                    height: 220.h,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          8.0), // Border radius untuk gambar
                      child: Image.network(
                        '${Credential.baseImage}/${nowShowing.posterPath}',
                        fit: BoxFit
                            .cover, // Mengubah fit menjadi cover agar gambar memenuhi container
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: Text(
                      nowShowing.title,
                      style: blackTextStyle.merge(semiBoldStyle),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: yellowColor, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        '${nowShowing.voteAverage.toStringAsFixed(1)}/10',
                        style: blackTextStyle.copyWith(color: greyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
