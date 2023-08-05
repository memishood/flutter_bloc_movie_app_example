import 'package:flutter/material.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.onTap,
    required this.movies,
  });
  final ValueChanged<MovieEntity> onTap;
  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, index) {
          final movie = movies[index];
          return InkWell(
            onTap: () => onTap(movie),
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        movie.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    movie.title.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 20),
      ),
    );
  }
}
