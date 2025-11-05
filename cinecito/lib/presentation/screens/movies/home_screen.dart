import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(dotenv.env['API_TMDB']);
    print(dotenv.env['TOKEN_SECRET_TMDB']);
    return const Scaffold(body: Center(child: Text("Hello Cinecito")));
  }
}
