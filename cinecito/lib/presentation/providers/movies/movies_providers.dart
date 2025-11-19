import 'package:cinecito/domain/entities/movie.dart';
import 'package:cinecito/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

final popularMoviesProvier = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (Ref) {
    final fetchMoreMovies = Ref.watch(movieRepositoryProvider).getUpcoming;
    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

final TopRatedMoviesProvier =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((Ref) {
      final fetchMoreMovies = Ref.watch(movieRepositoryProvider).getTopRated;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  final MovieCallBack fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    await Future.delayed(Duration(seconds: 2)); // Simular tiempo de espera
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
