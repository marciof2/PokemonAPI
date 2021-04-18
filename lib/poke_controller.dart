import 'package:pokemon/poke_model.dart';
import 'package:pokemon/pokemon.dart';

class PokeController {
  final model = PokeModel();

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    model.fetchPokemon();
  }
}
