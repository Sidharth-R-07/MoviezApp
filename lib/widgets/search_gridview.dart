import 'package:flutter/material.dart';
import 'package:moviez/models/movie_model.dart';

import '../pages/details_movie_page.dart';

class SearchGrid extends StatelessWidget {
  final List<MovieModel> movies;
  const SearchGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: deviceWidth < 500 ? 3 : 5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
      ),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        final _movie = movies[index];
        return Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsMoviePage(movie: movies[index]),
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
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${_movie.posterPath!}',
                    fit: BoxFit.fill,
                    scale: 1,
                  ),
                )),
          ),
        );
      },
    );
  }
}
