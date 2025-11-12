import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String key = dotenv.env['TOKEN_SECRET_TMBD'] ?? 'your_api_key';
  static String theBaseUrl =
      dotenv.env['API_TMDB'] ?? 'https://api.themoviedb.org/3';
}
