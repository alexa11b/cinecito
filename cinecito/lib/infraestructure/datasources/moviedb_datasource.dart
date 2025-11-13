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

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
        .toList();

    return movies;
  }
}
