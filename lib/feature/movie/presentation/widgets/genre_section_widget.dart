import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/utils/styles.dart';

class GenreSectionWidget extends StatelessWidget {
  final List genreIds;
  const GenreSectionWidget({super.key, required this.genreIds});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 4.h,
      children: genreIds.map((id) {
        String genreName = _getGenreName(id);
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: const Color(0XFFDBE3FF),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Text(
            genreName,
            style: whiteTextStyle.merge(
              smallStyle.copyWith(color: const Color(0XFF88A4E8)),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _getGenreName(int id) {
    switch (id) {
      case 28:
        return 'Action';
      case 12:
        return 'Adventure';
      case 16:
        return 'Animation';
      case 35:
        return 'Comedy';
      case 80:
        return 'Crime';
      case 99:
        return 'Documentary';
      case 18:
        return 'Drama';
      case 10751:
        return 'Family';
      case 14:
        return 'Fantasy';
      case 36:
        return 'History';
      case 27:
        return 'Horror';
      case 10402:
        return 'Music';
      case 9648:
        return 'Mystery';
      case 10749:
        return 'Romance';
      case 878:
        return 'Science Fiction';
      case 10770:
        return 'TV Movie';
      case 53:
        return 'Thriller';
      case 10752:
        return 'War';
      case 37:
        return 'Western';
      default:
        return 'Unknown';
    }
  }
}
