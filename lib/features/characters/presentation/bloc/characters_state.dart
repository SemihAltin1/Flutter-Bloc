part of 'characters_bloc.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  CharacterEntity character;
  CharactersLoaded({required this.character});
}

class CharactersError extends CharactersState {
  String? errorMessage;
  CharactersError(this.errorMessage);
}