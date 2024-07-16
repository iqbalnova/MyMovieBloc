import 'package:flutter/material.dart';
import 'package:mymoviebloc/feature/core/presentation/widgets/custom_appbar.dart';
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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Text(
          'DETAIL MOVIE',
          style: titleTextStyle,
        ),
      ),
    );
  }
}
