import 'package:cinecito/config/constants/environment.dart';
import 'package:cinecito/domain/datasoursces/movie_datasource.dart';
import 'package:cinecito/domain/entities/movie.dart';
import 'package:cinecito/infraestructure/Mappers/movie_mapper.dart';
import 'package:cinecito/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.theBaseUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Environment.key}',
      },
      queryParameters: {'languaje': 'es-MX'},
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final response = MovieDbResponse.fromJson(json);
    final List<Movie> movies = response.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    throw UnimplementedError();
  }
}
