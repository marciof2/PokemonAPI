class Pokemon {
  String nome;
  String photo;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    photo = json['sprites']['other']['official-artwork']['front_default'];
  }
}
