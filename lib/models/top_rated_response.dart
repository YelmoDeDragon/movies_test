// To parse this JSON data, do
//
//     final topRatedMovieResponse = topRatedMovieResponseFromMap(jsonString);

import 'dart:convert';

import 'package:movies/models/models.dart';

class TopRatedMovieResponse {
    TopRatedMovieResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory TopRatedMovieResponse.fromJson(String str) => TopRatedMovieResponse.fromMap(json.decode(str));

    factory TopRatedMovieResponse.fromMap(Map<String, dynamic> json) => TopRatedMovieResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}