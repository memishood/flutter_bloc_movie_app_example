import 'package:equatable/equatable.dart';

class SpokenLanguageEntity extends Equatable {
  const SpokenLanguageEntity(
    this.englishName,
    this.iso6391,
    this.name,
  );

  final String? englishName, iso6391, name;

  @override
  List<Object?> get props => [englishName, iso6391, name];
}
