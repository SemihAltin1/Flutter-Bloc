import 'package:the_last_airbender/features/characters/domain/entity/character.dart';
import '../../../../core/resources/data_state.dart';

abstract class CharactersRepository {

  Future<DataState<CharacterEntity>> getCharacter();

}