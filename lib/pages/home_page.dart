import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez/pages/search_page.dart';
import 'package:moviez/provider/api_provider.dart';

import '../widgets/movie_grid_view.dart';

import '../widgets/movie_slider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovies = ref.watch(getPopularMovies);
    final topRatedMovies = ref.watch(getTopRated);
    final upcomingMovies = ref.watch(getUpcomingMovies);
    final nowPlayingMovies = ref.watch(getNowPlayingMovies);

    // print(ref.watch(moviesFuture.future));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.movie_creation_outlined,
              color: Colors.redAccent,
              size: 40,
            ),
            Text('Moviez', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.redAccent,
              size: 32,
              opticalSize: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
//------------------------slider for upcoming movies-----------------
              upcomingMovies.when(
                data: (data) => MovieSlider(upcomingMovies: data),
                error: (error, stackTrace) {
                  print(
                      'print errorr-----------------------------------:$stackTrace');
                  print(error);

                  return Center(
                    child: Text('Something went wrong  :$error '),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                      color: Colors.redAccent, strokeWidth: 3),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Text(
                'Now Palying',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              nowPlayingMovies.when(
                data: (data) => MovieGridView(movies: data),
                error: (error, stackTrace) {
                  print('Error ---------------------:$error');
                  print(stackTrace);
                  return const Center(
                    child: Text('Sommething went wrong'),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                      color: Colors.redAccent, strokeWidth: 3),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Popular Movies',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              popularMovies.when(
                data: (data) => MovieGridView(movies: data),
                error: (error, stackTrace) {
                  print(
                      'print errorr-----------------------------------:$stackTrace');

                  print(error);

                  return Center(
                    child: Text('Something went wrong  :$error'),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                      color: Colors.redAccent, strokeWidth: 3),
                ),
              ),

              // const MovieGridView(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Top Rated',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),

              topRatedMovies.when(
                data: (data) => MovieGridView(movies: data),
                error: (error, stackTrace) => const Center(
                  child: Text('Sommething went wrong'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                      color: Colors.redAccent, strokeWidth: 3),
                ),
              ),

              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
