import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/data/models/movie/detail_movie.dart';
import 'package:mymoviebloc/feature/core/presentation/widgets/custom_button.dart';
import 'package:mymoviebloc/feature/movie_detail/bloc/detail_movie_bloc.dart';
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
                  _renderBodySection(detailMovie: state.detailMovie),
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

  Widget _renderBodySection({required DetailMovieModel detailMovie}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailMovie.title,
              style: titleTextStyle.merge(boldStyle).copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.star, color: yellowColor, size: 24.sp),
                SizedBox(width: 4.w),
                Text(
                  '${detailMovie.voteAverage.toStringAsFixed(1)}/10',
                  style: blackTextStyle.copyWith(color: greyColor),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            _genresSection(detailMovie.genres),

            SizedBox(height: 24.h),

            _movieInfoSection(
              duration: detailMovie.runtime,
              language: detailMovie.originalLanguage,
            ),

            SizedBox(height: 24.h),

            Text(
              'Description',
              style: blackTextStyle.merge(boldStyle).copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              detailMovie.overview,
              style: greyTextStyle.copyWith(height: 1.5),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cast",
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
            SizedBox(height: 8.h),
            // Tambahkan widget untuk daftar cast di sini
          ],
        ),
      ),
    );
  }

  Widget _genresSection(List<Genre> genres) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 4.h,
      children: genres.map((genre) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: const Color(0XFFDBE3FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            genre.name,
            style: whiteTextStyle.merge(
              smallStyle.copyWith(
                color: const Color(0XFF88A4E8),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _movieInfoSection({required int duration, required String language}) {
    String formatRuntime(int runtime) {
      final hours = runtime ~/ 60;
      final minutes = runtime % 60;
      return '${hours}h ${minutes}min';
    }

    const Map<String, String> languageMap = {
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'de': 'German',
      'it': 'Italian',
      'ja': 'Japanese',
      'zh': 'Chinese',
      'id': 'Indonesia'
      // Tambahkan kode bahasa lainnya sesuai kebutuhan
    };

    String convertIsoToLanguage(String isoCode) {
      return languageMap[isoCode] ?? 'Unknown';
    }

    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Duration',
              style: greyTextStyle.merge(
                semiBoldStyle,
              ),
            ),
            Text(
              formatRuntime(duration),
              style: blackTextStyle.merge(
                semiBoldStyle,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 32.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: greyTextStyle.merge(
                semiBoldStyle,
              ),
            ),
            Text(
              convertIsoToLanguage(language),
              style: blackTextStyle.merge(
                semiBoldStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
