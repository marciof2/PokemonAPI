import 'package:flutter/material.dart';

class Pokemon {
  String nome;
  String photo;
  var id;
  int tamanho;
  int peso;
  String tipo;
  List<Ability> abilities;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'].toString().toUpperCase();
    photo = json['sprites']['other']['official-artwork']['front_default'];
    id = json['id'];
    tamanho = json['height'];
    peso = json['weight'];
    tipo = json['types'][0]['type']['name'];

    var arrayAbilities = json['abilities'] as List;

    abilities = arrayAbilities.map((item) {
      return Ability.fromJson(item['ability']);
    }).toList();
  }
}

class Ability {
  String name;
  String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}