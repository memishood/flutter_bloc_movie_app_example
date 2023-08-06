import 'package:flutter/material.dart';
import 'package:flutter_bloc_movie_app_example/core/extension/widget_extensions.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movieDetails,
  });
  final MovieDetailsEntity movieDetails;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                movieDetails.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movieDetails.title != null) ...[
                    Text(
                      movieDetails.title.toString(),
                      style: const TextStyle(fontSize: 19),
                    ),
                  ],
                  if (movieDetails.tagline != null) ...[
                    Text(
                      movieDetails.tagline.toString(),
                      style: const TextStyle(fontSize: 15),
                    ).paddingOnly(top: 5),
                  ],
                ],
              ),
            ),
          ],
        ),
        if (movieDetails.overview != null) ...[
          Text(
            movieDetails.overview.toString(),
            style: const TextStyle(fontSize: 15),
          ).paddingOnly(top: 8),
        ],
        if (movieDetails.video == false) ...[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(movieDetails.title.toString()),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow),
              ),
              const Text('Video source is available'),
            ],
          ).paddingOnly(top: 16),
        ],
      ],
    );
  }
}
