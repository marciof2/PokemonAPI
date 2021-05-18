import 'api.dart';

class PokeModel {
  Future _pokemon;

  Future get pokemon => _pokemon;

  fetchPokemon() {
    _pokemon = API().fetchPokemon();
  }
}
