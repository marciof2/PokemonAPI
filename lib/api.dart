import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:pokemon/pokemon.dart';

class API {
  // ignore: missing_return
  Future<Pokemon> fetchPokemon() async {
    final response = await http.get(
        Uri.https('pokeapi.co', '/api/v2/pokemon/${Random().nextInt(1000)}'));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      return Future.error('Pokemon Not Found');
    }
  }
}
