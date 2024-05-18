import 'package:dio/dio.dart';
import 'package:the_last_airbender/core/resources/data_state.dart';
import 'package:the_last_airbender/features/characters/data/data_source/remote/characters_api_service.dart';
import 'package:the_last_airbender/features/characters/domain/entity/character.dart';
import '../../domain/repository/character_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CharactersApiService _apiService;
  CharactersRepositoryImpl(this._apiService);

  @override
  Future<DataState<CharacterEntity>> getCharacter() async {
    try {
      final response = await _apiService.getCharacter();
      if(response.statusCode == 200){
        return DataSuccess(response.data!);
      } else {
        return DataFailed(DioException(requestOptions: response.requestOptions,message: response.statusMessage,type: DioExceptionType.badResponse));
      }
    } on DioException catch(exception) {
      return DataFailed(exception);
    }
  }

}