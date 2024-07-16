import 'package:flutter/material.dart';
import 'package:mymoviebloc/feature/movie/presentation/widgets/nowshowing_widget.dart';
import 'package:mymoviebloc/feature/movie/presentation/widgets/popular_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NowShowingSection(),
            PopularSection(),
          ],
        ),
      ),
    );
  }
}
