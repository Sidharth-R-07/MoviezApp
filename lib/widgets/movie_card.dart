import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moviez/models/movie_model.dart';

import '../decorations/mytheme.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHieght = MediaQuery.of(context).size.height;
    final platformAndroid = defaultTargetPlatform == TargetPlatform.android;

    return Stack(
        alignment: Alignment.topLeft,
        fit: StackFit.passthrough,
        children: [
          SizedBox(
            width: platformAndroid?null:deviceWidth*.80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.backdropPath!}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: platformAndroid ? deviceWidth * .75 : deviceWidth * .90,
              height:
                 platformAndroid ? deviceHieght * .10 : deviceHieght * .16,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.30),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle!,
                      style: Theme.of(context).textTheme.displayLarge,
                      overflow: TextOverflow.ellipsis,
                           textScaleFactor: ScaleSize.textScaleFactor(context),

                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Release Date :',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          movie.releaseDate!,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Rating :',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          '${movie.voteAverage}/10',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]);
  }
}
