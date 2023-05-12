import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/movie.dart';

class MovieRepository {

  Future<List<MovieModel>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://randomuser.me/api/?results=20'),
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List _movies = body['results'];
      return _movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('There was an error loading contacts');
    }
  }
}