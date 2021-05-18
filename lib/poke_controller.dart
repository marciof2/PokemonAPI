import 'dart:async';
import 'package:pokemon/poke_model.dart';
import 'package:pokemon/pokemon.dart';

class PokeViewModel {
  final model = PokeModel();

  StreamController<Pokemon> streamController = StreamController();

  void loadPokemon() {
    model.fetchPokemon();
    model.pokemon.then((value) => {streamController.add(value)});
  }
}
