import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/movies_page.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MoviesPage(),
      ),
    ],
  );
}
