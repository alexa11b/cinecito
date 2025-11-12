import 'dart:math';

import 'package:cinecito/domain/entities/movie.dart';
import 'package:cinecito/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToMovieEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath,
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: MovieMapper.toPosterImage(moviedb.posterPath),
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
  static String toPosterImage(String path) {
    return path != '' ? 'https: //image.tmdb.org/t/p/w500$path' : 'no-poster';
  }
}
