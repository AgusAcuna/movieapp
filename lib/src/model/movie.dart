class MovieModel {
  MovieModel({
    required bool adult,
    required String backdropPath,
    required List<dynamic> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required String title,
    required String lowerCaseTitle,
    required bool video,
    required double voteAverage,
    required int voteCount,
  });

  factory MovieModel.fromJson(dynamic moviesJson) {
    return MovieModel(
      adult: moviesJson['adult'],
      backdropPath: moviesJson['backdrop_path'],
      genreIds: moviesJson['genre_ids'],
      id: moviesJson['id'],
      originalLanguage: moviesJson['original_language'],
      originalTitle: moviesJson['original_title'],
      overview: moviesJson['overview'],
      popularity: moviesJson['popularity'].toDouble(),
      posterPath: moviesJson['poster_path'],
      releaseDate: moviesJson['release_date'],
      title: moviesJson['title'],
      video: moviesJson['video'],
      voteAverage: moviesJson['vote_average'].toDouble(),
      voteCount: moviesJson['vote_count'],
      lowerCaseTitle: (moviesJson['title'] as String).toLowerCase(),
    );
  }
}