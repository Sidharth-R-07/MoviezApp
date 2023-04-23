import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez/models/movie_model.dart';
import 'package:moviez/pages/details_movie_page.dart';
import 'package:flutter/foundation.dart';


class MovieGridView extends ConsumerWidget {
  final List<MovieModel> movies;
  const MovieGridView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHieght = MediaQuery.of(context).size.height;
   final platformAndroid=defaultTargetPlatform==TargetPlatform.android;

    return SizedBox(
      height:deviceHieght<1300?  deviceHieght*.22   :  deviceHieght *.26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final _movie = movies[index];
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: deviceHieght*.10,
                width:platformAndroid? deviceWidth*.26:deviceWidth<600?deviceWidth*.26:deviceWidth*.16,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsMoviePage(movie: _movie),
                    ));
                  },
                  child: GridTile(
                      footer: Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.80),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: Text(_movie.originalTitle!,
                                textAlign: TextAlign.center,
                                style:Theme.of(context).textTheme.titleSmall),
                          )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${_movie.posterPath!}',
                          fit: BoxFit.fill,
                          scale: 1,
                        ),
                      )),
                ),
              ));
        },
      ),
    );
  }
}
