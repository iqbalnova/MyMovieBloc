import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/data/models/cast/cast_model.dart';
import 'package:mymoviebloc/feature/movie_detail/bloc/detail_movie_bloc.dart';
import 'package:mymoviebloc/utils/credential.dart';
import 'package:mymoviebloc/utils/styles.dart';

class CastGridSection extends StatelessWidget {
  final int movieId;

  const CastGridSection({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailMovieBloc()..add(GetCastEvent(movieId: movieId)),
      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state is CastSuccess) {
            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 120.h,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  CastModel cast = state.castData[index];

                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 5.0.w, vertical: 5.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              '${Credential.baseImage}/${cast.profilePath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            cast.name,
                            style: blackTextStyle.merge(smallStyle),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount:
                    state.castData.length > 8 ? 8 : state.castData.length,
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: SizedBox(),
            );
          }
        },
      ),
    );
  }
}
