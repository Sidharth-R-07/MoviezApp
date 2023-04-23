import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez/models/movie_model.dart';
import 'package:moviez/provider/api_provider.dart';
import 'package:moviez/widgets/search_gridview.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    final searchMovie =
        ref.watch(searchMovieNotier.notifier).searchMovie(searchText);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSearchBar(),
            _buildSearchResults(searchMovie),
          ],
        ),
      ),
    );
  }


  Widget _buildSearchBar(){
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 1),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Expanded(
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          searchText = val;
                        });
                      },
                      style: Theme.of(context).textTheme.titleMedium,
                      decoration: InputDecoration(
                          hintText: 'Search movie',
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            );
  }

  Expanded _buildSearchResults(Future<List<MovieModel>> searchMovie) {
    return Expanded(
      child: FutureBuilder(
        future: searchMovie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 600,
                width: 400,
                child: Lottie.asset('Assets/lottie/searching.json'),
              ),
            );
          }
          if (snapshot.data == null) {
            return Lottie.asset('Assets/lottie/no data found.json');
          }
          if (snapshot.data!.isEmpty) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image.asset(
                      'Assets/images/search movie.png',
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Search Movie',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            );
          }
          return SearchGrid(movies: snapshot.data!);
        },
      ),
    );
  }
}
