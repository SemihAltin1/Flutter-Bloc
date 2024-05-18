import 'package:dio/dio.dart';
import 'package:the_last_airbender/core/constacts/contants.dart';
import 'package:the_last_airbender/features/characters/data/data_source/remote/characters_api_service.dart';
import 'package:the_last_airbender/features/characters/data/model/character.dart';

class CharactersApiServiceImpl extends CharactersApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseApiUrl,
      headers: {
        "Accept": "application/json",
        "Content-type": "application/json",
      }
    ),
  );

  @override
  Future<Response<CharacterModel>> getCharacter() async {
    final result = await dio.get(
      "/api/v1/characters/random",
    );
    final characterList = CharacterModel.fromJson(result.data[0]);
    return Response(data: characterList, requestOptions: result.requestOptions,statusCode: result.statusCode,statusMessage: result.statusMessage);
  }

}