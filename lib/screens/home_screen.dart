import 'package:dojoproject/constants.dart';
import 'package:dojoproject/widgets/movie_card.dart';
import 'package:flutter/material.dart';

import '../src/model/movie.dart';
import '../src/repository/movie_repo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MovieModel>? _movies;
  bool _isLoading = true;
  final scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener((_scrollListener));
    getMovies();
  }

  Future<void> getMovies() async {
    _movies = await MovieRepository.fetchMovies(page.toString());
    setState(() {
      _isLoading = false;
    });
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      getMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text("Upcoming Movies"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _movies!.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                return MovieCard(
                  id: _movies![index].id,
                  title: _movies![index].title,
                  releaseDate: _movies![index].releaseDate,
                  value: _movies![index].voteAverage,
                  img: kimgPath+_movies![index].posterPath,
                );
              },
            ),
    );
  }
}
