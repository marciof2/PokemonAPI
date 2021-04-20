class Pokemon {
  String nome;
  String photo;
  var id;
  int tamanho;
  int peso;
  String tipo;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'].toString().toUpperCase();
    photo = json['sprites']['other']['official-artwork']['front_default'];
    id = json['id'];
    tamanho = json['height'];
    peso = json['weight'];
    tipo = json['types'][0]['type']['name'];
  }
}
