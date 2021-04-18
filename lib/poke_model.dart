import 'package:pokemon/pokemon.dart';
import 'api.dart';

class PokeModel {
  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon => _pokemon;

  fetchPokemon() {
    _pokemon = API().fetchPokemon();
  }
}
