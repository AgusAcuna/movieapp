import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/movie.dart';

class MovieRepository {

  static Future<List<MovieModel>> fetchMovies(String page) async {

    final queryParameters = {
      'api_key': 'a27551de23618dedee2e4d315ae32f84',
      'language': 'en-US',
      'page': page,
    };

    var uri = Uri.https('api.themoviedb.org','/3/movie/upcoming',queryParameters);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List _movies = body['results'];
      return _movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('There was an error loading movies');
    }
  }

  static Future<MovieModel> fetchMovieInfo(int id) async {

    final queryParameters = {
      'api_key': 'a27551de23618dedee2e4d315ae32f84',
      'language': 'en-US'
    };

    var uri = Uri.https('api.themoviedb.org','/3/movie/$id',queryParameters);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      //final body = jsonDecode(response.body);
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('There was an error loading movies');
    }
  }
}
