import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_last_airbender/core/resources/data_state.dart';
import 'package:the_last_airbender/features/characters/domain/usecase/get_character.dart';
import '../../domain/entity/character.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent,CharactersState> {
   final GetCharacterUseCase _getCharactersUseCase;
   CharactersBloc(this._getCharactersUseCase) : super(CharactersInitial()){
     on<GetCharacters>(getCharacters);
   }


   Future<void> getCharacters(GetCharacters event, Emitter<CharactersState> emit) async {
     emit(CharactersLoading());
     final dataState = await _getCharactersUseCase.call(null);
     if(dataState is DataSuccess){
       emit(CharactersLoaded(character: dataState.data!));
     } else if(dataState is DataFailed){
       emit(CharactersError(dataState.exception!.message));
     }
   }
}