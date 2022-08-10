import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/providers/movies_provider.dart';
import 'package:movies/search/search_delegate.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showSearch(
                context: context, 
                delegate: MovieSearchDelegate()
              ), 
              icon: const Icon(Icons.search_outlined)
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MovieSlider(
                movies: moviesProvider.onDisplayMovies, 
                title: 'Now Displaying',
                onNextPage: () => moviesProvider.getOnDisplayMovies()
              ),
              MovieSlider(
                movies: moviesProvider.topRatedMovies, 
                title: 'Top Rated',
                onNextPage: () => moviesProvider.getTopRatedMovies()
              ),
            ],
          ),
        ));
  }
}
