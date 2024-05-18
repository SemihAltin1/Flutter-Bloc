import 'package:the_last_airbender/features/characters/domain/entity/character.dart';

class CharacterModel extends CharacterEntity {

  CharacterModel({
    required super.id,
    super.name,
    super.imageUrl,
    super.weapon,
    super.gender,
    super.position,
  });

  factory CharacterModel.fromJson(Map<String,dynamic> json) => CharacterModel(
    id: json["_id"],
    name: json["name"],
    imageUrl: json["photoUrl"],
    weapon: json["weapon"],
    gender: json["gender"],
    position: json["position"],
  );
}