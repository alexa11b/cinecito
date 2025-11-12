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
      queryParameters: {'apy_key': Environment.key, 'language': 'es-Mx'},
    ),
  );

  @override
  Future<List<Map<String, dynamic>>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
        .toList();
    return List<Map<String, dynamic>>.from(response.data['results']);
  }
}
