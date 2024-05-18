import 'package:dio/dio.dart';
import 'package:the_last_airbender/features/characters/data/model/character.dart';

abstract class CharactersApiService {
  Future<Response<CharacterModel>> getCharacter();
}