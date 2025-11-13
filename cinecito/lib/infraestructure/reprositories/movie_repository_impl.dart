import 'package:cinecito/domain/datasoursces/movie_datasource.dart';
import 'package:cinecito/domain/entities/movie.dart';
import 'package:cinecito/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
