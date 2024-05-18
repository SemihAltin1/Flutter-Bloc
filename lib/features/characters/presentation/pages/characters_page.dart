import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_last_airbender/features/characters/data/data_source/remote/characters_api_service_impl.dart';
import 'package:the_last_airbender/features/characters/data/repository/characters_repository_impl.dart';
import 'package:the_last_airbender/features/characters/domain/usecase/get_character.dart';
import 'package:the_last_airbender/features/characters/presentation/bloc/characters_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharactersBloc _bloc = CharactersBloc(GetCharacterUseCase(CharactersRepositoryImpl(CharactersApiServiceImpl())));

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCharacters());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBloc(),
      floatingActionButton: _buildRefreshButton(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text("Characters"),
    );
  }
  _buildBloc() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, state) {
        if(state is CharactersLoading){
          return _showLoadingAnimation();
        } else if(state is CharactersLoaded){
          return _buildCharactersList(state);
        } else if(state is CharactersError){
          return _buildErrorView(state);
        } else {
          return _buildInitialView();
        }
      },
    );
  }

  _showLoadingAnimation() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  _buildInitialView(){
    return const SizedBox();
  }
  _buildCharactersList(CharactersLoaded state) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        Image.network(
          state.character.imageUrl ?? "",
          fit: BoxFit.fitWidth,
          errorBuilder: (context,object,trace){
            return const Text("Image Not Found");
          },
        ),
        const SizedBox(height: 20),
        Text("Name : ${state.character.name}"),
        Text("Gender : ${state.character.gender}"),
        Text("Weapon : ${state.character.weapon}"),
        Text("Position : ${state.character.position}"),
      ],
    );
  }
  _buildErrorView(CharactersError state) {
    return Column(
      children: [
        Text("Something went wrong\n${state.errorMessage ?? ""}"),
        ElevatedButton(
          onPressed: (){
            _bloc.add(GetCharacters());
          },
          child: const Text("Try Again"),
        ),
      ],
    );
  }
  _buildRefreshButton() {
    return FloatingActionButton(
      onPressed: (){
        _bloc.add(GetCharacters());
      },
      child: const Icon(Icons.refresh),
    );
  }

}
