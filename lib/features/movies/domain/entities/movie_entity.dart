import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieEntity extends Equatable {
  const MovieEntity(
    this.id,
    this.title,
    this.posterPath,
  );

  final int id;
  final String title, posterPath;

  String get image => '${dotenv.get('IMAGE_BASE_URL')}/$posterPath';

  @override
  List<Object?> get props => [id, title, posterPath];
}
