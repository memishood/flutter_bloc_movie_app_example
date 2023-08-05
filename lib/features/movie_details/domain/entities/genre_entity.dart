import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  const GenreEntity(
    this.id,
    this.name,
  );

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
