import 'package:the_last_airbender/core/resources/data_state.dart';
import 'package:the_last_airbender/core/usecase/usecase.dart';
import 'package:the_last_airbender/features/characters/domain/entity/character.dart';
import 'package:the_last_airbender/features/characters/domain/repository/character_repository.dart';

class GetCharacterUseCase extends UseCase<DataState<CharacterEntity>,void> {
  final CharactersRepository _repository;
  GetCharacterUseCase(this._repository);

  @override
  Future<DataState<CharacterEntity>> call(void params) {
    return _repository.getCharacter();
  }

}