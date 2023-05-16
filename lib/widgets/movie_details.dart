import 'package:dojoproject/constants.dart';
import 'package:dojoproject/src/model/movie.dart';
import 'package:flutter/material.dart';
import '../src/repository/movie_repo.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.id});

  final int id;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieModel? movie;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getMovieInfo();
  }

  Future<void> getMovieInfo() async {
    movie = await MovieRepository.fetchMovieInfo(widget.id);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _isLoading
        ? const CircularProgressIndicator()
        : Scaffold(
            backgroundColor: kPrimaryColor,
            appBar: AppBar(
              backgroundColor: kBackgroundColor,
              elevation: 0,
              leading: IconButton(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                movie!.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding),
                        height: size.width * 0.8,
                        child: Stack(
                          children: [
                            Container(
                              height: size.height * 0.7,
                              width: size.width * 0.7,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              height: size.height * 0.7,
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    kimgPath + movie!.posterPath,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
