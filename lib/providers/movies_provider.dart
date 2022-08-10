/*En este archivo vamos a buscar toda la información que queremos mostrar en la APP*/
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '8dad4cac7ac4c0c470a9f0a683be7551';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> topRatedMovies = [];
  int _topRatedPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getTopRatedMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endPoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final onDisplayResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = [...onDisplayMovies,...onDisplayResponse.results];
    notifyListeners();
  }

  getTopRatedMovies() async {
    _topRatedPage++;
    final jsonData = await _getJsonData('3/movie/top_rated', _topRatedPage);
    final topRatedResponse = TopRatedMovieResponse.fromJson(jsonData);
    topRatedMovies = [...topRatedMovies, ...topRatedResponse.results];
    notifyListeners();
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    final response = await http.get(url);
    final searchMovieResponse = SearchMovieResponse.fromJson(response.body);
    return searchMovieResponse.results;
  }
}
