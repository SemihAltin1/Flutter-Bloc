import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  String id;
  String? name;
  String? imageUrl;
  String? weapon;
  String? position;
  String? gender;
  CharacterEntity({
    required this.id,
    this.name,
    this.imageUrl,
    this.weapon,
    this.position,
    this.gender,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, weapon, position, gender];
}