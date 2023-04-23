import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moviez/models/movie_model.dart';
import 'package:moviez/provider/api_provider.dart';

class DetailsMoviePage extends ConsumerWidget {
  final MovieModel movie;
  DetailsMoviePage({super.key, required this.movie});
  // movieGeners() {

  //   print('Movies geners List :$movieGen');
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieGeners =
        ref.watch(genersList.notifier).getGenerList(movie.genreIds!);
    print(movieGeners);
    return SafeArea(
      child: Scaffold(
     
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(25)),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movie.backdropPath!}'),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.originalTitle!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieGeners.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.redAccent, width: .5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  movieGeners[index],
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[600],
                          size: 42,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${movie.voteAverage}/10',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '(${movie.voteCount})',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Release Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '${movie.releaseDate}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Language',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              movie.originalLanguage!,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Summery',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie.overview!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
