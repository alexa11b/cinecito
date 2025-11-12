abstract class MoviesDatasource {
  Future<List<Map<String, dynamic>>> getNowPlaying({int page = 1});
}
