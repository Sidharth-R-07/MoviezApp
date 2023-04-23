import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moviez/models/movie_model.dart';
import 'package:moviez/widgets/movie_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/foundation.dart';


class MovieSlider extends StatefulWidget {
  final List<MovieModel> upcomingMovies;
  const MovieSlider({super.key, required this.upcomingMovies});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  int activeInex = 0;
  @override
  Widget build(BuildContext context) {
   final deviceWidth= MediaQuery.of(context).size.width;
   final deviceHieght= MediaQuery.of(context).size.height;


   final platformAndroid=defaultTargetPlatform==TargetPlatform.android;
   print('device hieght: $deviceHieght');


    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: widget.upcomingMovies.length,
          itemBuilder: (context, index, realIndex) =>
              MovieCard(movie: widget.upcomingMovies[index]),
          options: CarouselOptions(
            
            height:platformAndroid?deviceHieght*.30   :deviceWidth<600?deviceHieght*.40 : deviceHieght*.70,
            autoPlay: true,
            autoPlayInterval: const Duration(milliseconds: 3500),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeInex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        _buiidIndicator()
      ],
    );
  }

  _buiidIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeInex,
        count: widget.upcomingMovies.length,
        effect: ExpandingDotsEffect(
            activeDotColor: Colors.redAccent,
            dotHeight: 3,
            dotWidth: 3,
            dotColor: Colors.grey.withOpacity(0.80)),
      );
}
